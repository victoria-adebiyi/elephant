//
//  LoginViewController.swift
//  App12
//
//  Created by Jeff Wang on 6/20/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {
    let database = Firestore.firestore()
    
    let loginView = LoginView()
    
    let childProgressView = ProgressSpinnerViewController()
    
    var selectedUser = "patient"
    
    override func loadView() {
        view = loginView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        loginView.buttonLogin.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
    }
    
    @objc func onLoginTapped(){
        print("logging tapped")
        
        //MARK: creating a new user on Firebase...
        if let email = loginView.textFieldEmail.text,
           let password = loginView.textFieldPassword.text{
            //MARK: sign-in logic for Firebase...
            self.showActivityIndicator()
            self.signInToFirebase(email: email, password: password)
        }
    }
    
    func signInToFirebase(email: String, password: String){
        //MARK: can you display progress indicator here?
        //MARK: authenticating the user...
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                //MARK: user authenticated and pop the corresponding controller...
                let lowercasedEmail = email.lowercased()
                let docDocuRef = self.database.collection("doctor").document(lowercasedEmail)
                let patDocuRef = self.database.collection("patient").document(lowercasedEmail)
                
                docDocuRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        //                        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                        let DLPScreen = DLPViewController()
                        self.hideActivityIndicator()
                        self.navigationController?.pushViewController(DLPScreen, animated: true)
                    } else {
                        patDocuRef.getDocument { (document, error) in
                            if let document = document, document.exists {
                                //                                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                                let PLPScreen = PLPViewController()
                                self.hideActivityIndicator()
                                self.navigationController?.pushViewController(PLPScreen, animated: true)
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
                
                
            }else{
                //MARK: alert that no user found or password wrong...
                let alert = UIAlertController(title: "Error!", message: "No user found or password is wrong!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
        })
    }
}

