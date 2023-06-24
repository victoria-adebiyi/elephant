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
                    self.setNameOfTheUserInFirebaseAuth(name: name)
                    
                    if self.selectedUser == "Patient" {
                        self.makePatient(name: name, email: email)
                    } else {
                        
                    }
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
    
    func makePatient(name: String, email: String) {
        let collectionContacts = database
            .collection("users")
            .document(email)
            .collection(self.selectedUser)
        
        //MARK: show progress indicator...
        showActivityIndicator()
        do{
            try collectionContacts.addDocument(from: Patient(name: name, email: email, age: <#T##Int#>), completion: {(error) in
                if error == nil{
                    //MARK: hide progress indicator...
                    self.hideActivityIndicator()
                    
                    self.navigationController?.popViewController(animated: true)
                }
            })
        }catch{
            print("Error adding document!")
        }
    }
}
