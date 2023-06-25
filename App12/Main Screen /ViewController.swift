//
//  ViewController.swift
//  App12
//
//  Created by Sakib Miazi on 6/1/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {

    let mainScreen = MainScreenView()
    
    let childProgressView = ProgressSpinnerViewController()
        
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
                self.mainScreen.labelText.text = "Please sign in to see your health information!"
                self.mainScreen.seeProfileButton.isEnabled = false
                self.mainScreen.seeProfileButton.isHidden = true
                
                //MARK: Sign in bar button...
                self.setupRightBarButton(isLoggedin: false)
                
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                self.mainScreen.labelText.text = "Welcome \(user?.displayName ?? "Anonymous")!"
                
                self.mainScreen.seeProfileButton.isEnabled = true
                self.mainScreen.seeProfileButton.isHidden = false
                self.mainScreen.seeProfileButton.setTitle("Profile", for: .normal)
                self.mainScreen.seeProfileButton.addTarget(self, action: #selector(self.addSeeProfileButtonTapped), for: .touchUpInside)

                
                //MARK: Logout bar button...
                self.setupRightBarButton(isLoggedin: true)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Elephant Telehealth"
        
        //MARK: Make the titles look large...
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.mainScreen.seeProfileButton.isEnabled = false
        self.mainScreen.seeProfileButton.isHidden = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    
    func signIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    @objc func addSeeProfileButtonTapped(){
        self.showActivityIndicator()
        Configs.myEmail = (currentUser?.email!.lowercased())!
        let docDocuRef = self.database.collection("doctor").document(Configs.myEmail)
        let patDocuRef = self.database.collection("patient").document(Configs.myEmail)
        
        docDocuRef.getDocument { (document, error) in
            if let document = document, document.exists {
                //                        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                let DLPScreen = DLPViewController()
                self.hideActivityIndicator()
                self.navigationController?.pushViewController(DLPScreen, animated: true)
            } else {
                patDocuRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let plpScreen = PLPViewController()
                        self.hideActivityIndicator()
                        self.navigationController?.pushViewController(plpScreen, animated: true)
                    } else {
                        self.hideActivityIndicator()
                        print("Document does not exist")
                        //MARK: alert that patient data is missing
                        let alert = UIAlertController(title: "Error!", message: "Error finding user data. Please contact support.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(alert, animated: true)
                    }
                }
                
            }
        }
    }
}


