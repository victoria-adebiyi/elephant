//
//  PLPViewController.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/22/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class PLPViewController: UIViewController {
    var plpScreen = PLPView()
    
    var currentUser:FirebaseAuth.User?
    
//    var myEmail = ""
    
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

        plpScreen.buttonEditPFP.addTarget(self, action: #selector(onEditButtonTapped), for: .touchUpInside)
        plpScreen.buttonDoctor.addTarget(self, action: #selector(onDoctorsButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [barLogout]
        
        self.plpScreen.buttonMedication.addTarget(self, action: #selector(onButtonMedicationTapped), for: .touchUpInside)
        self.plpScreen.buttonSymptoms.addTarget(self, action: #selector(onButtonSymptomTapped), for: .touchUpInside)
        self.plpScreen.buttonEditPFP.addTarget(self, action: #selector(onButtonEditPFPTapped), for: .touchUpInside)
    }
    
    override func loadView() {
        view = plpScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        self.navigationItem.hidesBackButton = true;
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
                self.plpScreen.labelName.text = "No User Data Found!"
                self.plpScreen.labelAge.text = "Age: Null"
                
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                if let url = self.currentUser?.photoURL{
                    self.plpScreen.profilePic.loadRemoteImage(from: url)
                }
                
                if let lowercasedEmail = user!.email?.lowercased() {
                    let patDocuRef = self.database.collection("patient").document(lowercasedEmail)
                    
                    patDocuRef.getDocument(as: Patient.self) { result in
                        switch result {
                        case .success(let patient):
                            self.plpScreen.labelName.text = patient.name
                            self.plpScreen.labelAge.text = "Age: \(patient.age)"
                        case .failure(let error):
                            print("Error decoding patient: \(error)")
                        }
                    }
                }
            }
        }
    }
    
    
    @objc func onEditButtonTapped(){
        let patProf = database.collection("patient").document(Configs.myEmail)
        patProf.getDocument(as: Patient.self) { result in
            switch result {
            case .success(let patient):
                print("YAY")
                // A doctor value was successfully initialized from the DocumentSnapshot.
                var pat = Patient(name: patient.name, email: patient.email, phone: patient.phone, age: patient.age)
                self.showEditAlert(name: patient.name, email: patient.email, phone: patient.phone, age: patient.age)
            case .failure(let error):
                print("something went wrong getting the account to be edited")
            }
        }
        
    }
    
    func showEditAlert(name: String, email: String, phone: Int, age: Int){
        let editProfAlert = UIAlertController(
            title: "Edit Profile",
            message: "Edit your specialty and/or phone number",
            preferredStyle: .alert)
        
        editProfAlert.addTextField{ textField in
            textField.placeholder = "Specialty"
            textField.text = "\(age)"
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
            if let uwAge = editProfAlert.textFields![0].text,
               let uwPhone = editProfAlert.textFields![1].text{
                if !self.isValidPhone(uwPhone) {
                    self.showErrorAlertText(text: "Invalid phone!")
                }
                else {
                    if let intPhone = Int(uwPhone),
                    let intAge = Int(uwAge){
                        self.changeFields(name: name, email: email, phone: intPhone, age: intAge)
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
    
    func changeFields(name: String, email: String, phone: Int, age: Int){
        let docProf = database.collection("patient").document(Configs.myEmail)
        
        docProf.setData([
            "name": name,
            "email": email,
            "phone": phone,
            "age": age
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                self.plpScreen.labelAge.text = "Age: \(age)"
                print("Document successfully written!")
            }
        }
    }
    
    
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }
    

    @objc func onDoctorsButtonTapped(){
        let patientsDocsScreen = PatientsDoctorsViewController()
//        patientsDocsScreen.myEmail = self.myEmail.lowercased()
        //        patientsDocsScreen.currentUser = self.currentUser
        navigationController?.pushViewController(patientsDocsScreen, animated: true)
    }

    @objc func onButtonMedicationTapped() {
        let medicationScreen = MedicationsViewController()
        medicationScreen.delegate = self
        self.navigationController?.pushViewController(medicationScreen, animated: true)
    }
    
    @objc func onButtonSymptomTapped() {
        let symptomScreen = SymptomsViewController()
        symptomScreen.delegate = self
        self.navigationController?.pushViewController(symptomScreen, animated: true)
    }
    
    @objc func onButtonEditPFPTapped() {
        let editPFPScreen = EditPFPViewController()
        self.navigationController?.pushViewController(editPFPScreen, animated: true)
    }
    
    @objc func onBarLogoutButtonTapped() {
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

