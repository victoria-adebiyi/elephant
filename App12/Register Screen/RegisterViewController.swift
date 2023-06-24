//
//  RegisterViewController.swift
//  App12
//
//  Created by Sakib Miazi on 6/2/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class RegisterViewController: UIViewController {
    
    let database = Firestore.firestore()
    
    let registerView = RegisterView()
    
    let childProgressView = ProgressSpinnerViewController()
    
    let users: [String] = ["Patient", "Doctor"]
        
    var selectedUser = "Patient"
    
    override func loadView() {
        view = registerView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: adding the PickerView delegate and data source...
        registerView.pickerUser.delegate = self
        registerView.pickerUser.dataSource = self
        
        registerView.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        title = "Register"
    }
    
    @objc func onRegisterTapped(){
        if let email = registerView.textFieldEmail.text,
           let phone = registerView.textFieldPhone.text,
           let password = registerView.textFieldPassword.text,
           let passwordVerify = registerView.textFieldPasswordVerify.text{
            if !isValidEmail(email) {
                showErrorAlertText(text: "Invalid email!")
            } else if !isValidPhone(phone) {
                showErrorAlertText(text: "Invalid phone!")
            } else if password != passwordVerify {
                showErrorAlertText(text: "Passwords do not match!")
            }
            else{
                //MARK: creating a new user on Firebase...
                registerNewAccount()
            }
        }
    }
    
    // Borrowed from Maxim Shoustin and Zandor Smith from https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift/25471164#25471164
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPhone(_ phone: String) -> Bool {
        return phone.count == 10 && Int(phone) != nil
    }
    
    func showErrorAlert(){
        let alert = UIAlertController(title: "Error!", message: "The fields cannot be empty!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showErrorAlertText(text:String){
        let alert = UIAlertController(title: "Error!", message: "\(text)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

//MARK: implementing user PickerView...
extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource{
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
        registerView.swapAoS()
        return users[row]
    }
}
