//
//  RegisterFirebaseManager.swift
//  App12
//
//  Created by Sakib Miazi on 6/2/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

extension RegisterViewController{
    
    func registerNewAccount(){
        //MARK: display the progress indicator...
        showActivityIndicator()
        //MARK: create a Firebase user with email and password...
        if let name = registerView.textFieldName.text,
           let email = registerView.textFieldEmail.text,
           let password = registerView.textFieldPassword.text{
            //Validations....
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    //MARK: the user creation is successful...
                    
                    if let phone = Int(self.registerView.textFieldPhone.text!) {
                        if self.selectedUser == "Patient" {
                            if let age = Int(self.registerView.textFieldAoS.text!) {
                                self.initPatient(name: name, email: email, phone: phone, age: age)
                            }
                        } else {
                            if let specialty = self.registerView.textFieldAoS.text {
                                self.initDoctor(name: name, email: email, phone: phone, specialty: specialty)
                            }
                        }
                    }
                    
                    self.setNameOfTheUserInFirebaseAuth(name: name)
                }else{
                    //MARK: there is a error creating the user...
                    print(error)
                }
            })
        }
    }
    
    //MARK: We set the name of the user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                
                //MARK: hide the progress indicator...
                self.hideActivityIndicator()
                
                //MARK: pop the current controller...
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
    
    func initPatient(name: String, email: String, phone: Int, age: Int) {
        let collectionPatient = database.collection("patient")
        
        do{
            try collectionPatient.addDocument(from: Patient(name: name, email: email, phone: phone, age: age), completion: {(error) in
                if error == nil{
                }
            })
        }catch{
            print("Error adding patient document!")
        }
    }
    
    func initDoctor(name: String, email: String, phone: Int, specialty: String) {
        let collectionDoctor = database.collection("doctor")
        
        do{
            try collectionDoctor.addDocument(from: Doctor(name: name, email: email, phone: phone, specialty: specialty), completion: {(error) in
                if error == nil{
                }
            })
        }catch{
            print("Error adding doctor document!")
        }
    }
}
