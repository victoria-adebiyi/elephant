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
        
        dlpScreen.buttonEditPFP.addTarget(self, action: #selector(onEditButtonTapped), for: .touchUpInside)
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
    
    
    
    @objc func onEditButtonTapped(){
        let docProf = database.collection("doctor").document(Configs.myEmail)
        docProf.getDocument(as: Doctor.self) { result in
            switch result {
            case .success(let doctor):
                print("YAY")
                // A doctor value was successfully initialized from the DocumentSnapshot.
                var doc = Doctor(name: doctor.name, email: doctor.email, phone: doctor.phone, specialty: doctor.specialty)
                self.showEditAlert(name: doctor.name, email: doctor.email, phone: doctor.phone, specialty: doctor.specialty)
            case .failure(let error):
                print("something went wrong getting the account to be editted")
            }
        }
        
    }
    
    func showEditAlert(name: String, email: String, phone: Int, specialty: String){
        let editProfAlert = UIAlertController(
            title: "Edit Profile",
            message: "Edit your specialty and/or phone number",
            preferredStyle: .alert)
        
        editProfAlert.addTextField{ textField in
            textField.placeholder = "Specialty"
            textField.text = specialty
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        editProfAlert.addTextField{ textField in
            textField.placeholder = "Phone Number"
            textField.text = "\(phone)"
            textField.contentMode = .center
            textField.keyboardType = .phonePad
        }
        
        let EditAction = UIAlertAction(title: "Done", style: .default, handler: {(_) in
            if let uwSpecialty = editProfAlert.textFields![0].text,
               let uwPhone = editProfAlert.textFields![1].text{
                if !self.isValidPhone(uwPhone) {
                    self.showErrorAlertText(text: "Invalid phone!")
                }
                else {
                    if let intPhone = Int(uwPhone){
                        self.changeFields(name: name, email: email, phone: intPhone, specialty: uwSpecialty)
                    }
                }
            }
        })
        
        //MARK: action buttons...
        editProfAlert.addAction(EditAction)
        
        self.present(editProfAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            editProfAlert.view.superview?.isUserInteractionEnabled = true
            editProfAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
    
    func changeFields(name: String, email: String, phone: Int, specialty: String){
        let docProf = database.collection("doctor").document(Configs.myEmail)
        
        docProf.setData([
            "name": name,
            "email": email,
            "phone": phone,
            "specialty": specialty
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                self.dlpScreen.labelSpecialty.text = "Specialty: \(specialty)"
                print("Document successfully written!")
            }
        }
    }
    
    
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
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
    
    
    
    func isValidPhone(_ phone: String) -> Bool {
        return phone.count == 10 && Int(phone) != nil
    }
    
    func showErrorAlertText(text:String){
        let alert = UIAlertController(title: "Error!", message: "\(text)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    
}

