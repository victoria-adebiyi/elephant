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
        //MARK: creating a new user on Firebase...
        registerNewAccount()
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
        return users[row]
    }
}
