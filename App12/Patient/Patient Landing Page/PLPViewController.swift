//
//  PLPViewController.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/22/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class PLPViewController: UIViewController {
    var plpScreen = PLPView()
    
    var currentUser:FirebaseAuth.User?
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    let database = Firestore.firestore()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barLogout = UIBarButtonItem(
            title: "Logout",
            style: .plain,
            target: self,
            action: #selector(onBarLogoutButtonTapped)
        )
        
        navigationItem.rightBarButtonItems = [barLogout]
    }
    
    override func loadView() {
        view = plpScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        self.navigationItem.hidesBackButton = true;
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
                self.plpScreen.labelName.text = "No User Data Found!"
                self.plpScreen.labelAge.text = "Age: Null"
                
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                if let lowercasedEmail = user!.email?.lowercased() {
                    let patDocuRef = self.database.collection("patient").document(lowercasedEmail)
                    
                    patDocuRef.getDocument(as: Patient.self) { result in
                        switch result {
                        case .success(let patient):
                            self.plpScreen.labelName.text = patient.name
                            self.plpScreen.labelAge.text = "Age: \(patient.age)"
                        case .failure(let error):
                            print("Error decoding patient: \(error)")
                        }
                    }
                }
            }
        }
    }
    
    @objc func onBarLogoutButtonTapped(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?", preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                    self.navigationController?.popToRootViewController(animated: true)
                }catch{
                    print("Error occured!")
                }
            })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
    }

}
