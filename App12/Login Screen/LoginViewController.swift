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
    
    let loginView = LoginView()
    
    let childProgressView = ProgressSpinnerViewController()
    
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
            self.signInToFirebase(email: email, password: password)
        }
    }
    
    func signInToFirebase(email: String, password: String){
        //MARK: can you display progress indicator here?
        //MARK: authenticating the user...
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                //MARK: user authenticated and pop the current controller...
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: alert that no user found or password wrong...
                let alert = UIAlertController(title: "Error!", message: "No user found or password is wrong!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
        })
    }
}
