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
    
    let users: [String] = ["Patient", "Doctor"]
        
    var selectedUser = "Patient"
    
    override func loadView() {
        view = loginView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: adding the PickerView delegate and data source...
        loginView.pickerUser.delegate = self
        loginView.pickerUser.dataSource = self
        
        loginView.buttonLogin.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
    }
    
    @objc func onLoginTapped(){
        print("logging tapped")
        
        //MARK: creating a new user on Firebase...
        if let email = loginView.textFieldEmail.text,
           let password = loginView.textFieldEmail.text{
            //MARK: sign-in logic for Firebase...
            self.signInToFirebase(email: email, password: password)
        }
    }
    
    func signInToFirebase(email: String, password: String){
        print("signing in")
        //MARK: can you display progress indicator here?
        //MARK: authenticating the user...
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                //MARK: user authenticated...
                //MARK: pop the current controller...
                print("success")
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: alert that no user found or password wrong...
                print("fail")
            }
        })
    }
}

//MARK: implementing user PickerView...
extension LoginViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    //returns the number of columns/components in the Picker View...
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //returns the number of rows in the current component...
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return users.count
    }
    
    //set the title of currently picked row...
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedUser = users[row]
        return users[row]
    }
}
