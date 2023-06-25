//
//  DLPViewController.swift
//  App12
//
//  Created by Eden Gugsa on 6/23/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class DLPViewController: UIViewController {
    var dlpScreen = DLPView()
    
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
        
        dlpScreen.buttonPatients.addTarget(self, action: #selector(onPatientsButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [barLogout]
    }
    
    override func loadView() {
        view = dlpScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        self.navigationItem.hidesBackButton = true;
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
                self.dlpScreen.labelName.text = "No User Data Found!"
                self.dlpScreen.labelSpecialty.text = "Specialty: Null"
                
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                if let lowercasedEmail = user!.email?.lowercased() {
                    let patDocuRef = self.database.collection("doctor").document(lowercasedEmail)
                    
                    patDocuRef.getDocument(as: Doctor.self) { result in
                        switch result {
                        case .success(let doctor):
                            self.dlpScreen.labelName.text = doctor.name
                            self.dlpScreen.labelSpecialty.text = "Specialty: \(doctor.specialty)"
                        case .failure(let error):
                            print("Error decoding doctor: \(error)")
                        }
                    }
                }
            }
        }
    }
    
    @objc func onPatientsButtonTapped(){
        let docsPatientsScreen = DoctorsPatientsViewController()
//        addContactController.currentUser = self.currentUser
        navigationController?.pushViewController(docsPatientsScreen, animated: true)
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
