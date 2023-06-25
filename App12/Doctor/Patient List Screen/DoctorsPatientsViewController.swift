//
//  DoctorsPatientsViewController.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import UIKit
import FirebaseFirestore

class DoctorsPatientsViewController: UIViewController {
    var docsPatientsScreen = DoctorsPatientsView()
    
    var patients = [Patient]()
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = docsPatientsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Patients"
        
        updatePatients()
        
        patients.append(Patient(name: "Eden", email: "e@g.com", phone: 1000000000, age: 20))
        patients.append(Patient(name: "Herry", email: "h@g.com", phone: 1000000001, age: 15))
        
        docsPatientsScreen.tableViewPatients.delegate = self
        docsPatientsScreen.tableViewPatients.dataSource = self
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }
    
    
    func updatePatients(){
        patients.removeAll()
        print("reached")
        print(Configs.myEmail)
        var patList = self.database.collection("doctor").document(Configs.myEmail).collection("patientsList")
        patList.getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    do {
                        var data = try document.data(as: PatientsList.self)
                        var patInList = PatientsList(email: data.email.lowercased())

                        var patProf = self.database.collection("patient").document(patInList.email)

                        patProf.getDocument(as: Patient.self) { result in
                            switch result {
                            case .success(let patient):
                                print("YAY")
                                // A patient value was successfully initialized from the DocumentSnapshot.
                                var addedPatient = Patient(name: patient.name, email: patient.email, phone: patient.phone, age: patient.age)
                                self.patients.append(addedPatient)
                                print(self.patients)

                                self.docsPatientsScreen.tableViewPatients.reloadData()
                            case .failure(let error):
                                // A patient value could not be initialized from the DocumentSnapshot.
                                self.showErrorAlert(errorMessage: "Account does not exist. Please try again!")
                            }
                        }
                    }
                    catch {
                        print("Could not decode patlist")
                    }
                }
            }
        }
    }
    
    
    @objc func onAddBarButtonTapped(){
        let addPatientAlert = UIAlertController(
            title: "Add Patient",
            message: "Please enter patient email",
            preferredStyle: .alert)
        
        //MARK: setting up email textField in the alert...
        addPatientAlert.addTextField{ textField in
            textField.placeholder = "Enter email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        //MARK: Sign In Action...
        let addPatientAction = UIAlertAction(title: "Add", style: .default, handler: {(_) in
            if let email = addPatientAlert.textFields![0].text{
                var ptProf = self.database.collection("patient").document(email)
                var listOfPat = self.database.collection("doctor").document(Configs.myEmail).collection("patientsList")
                
                ptProf.getDocument(as: Patient.self) { result in
                    switch result {
                    case .success(let patient):
                        print("YAY")
                        // A patient value was successfully initialized from the DocumentSnapshot.
                        var addedPatient = Patient(name: patient.name, email: patient.email, phone: patient.phone, age: patient.age)
                        self.patients.append(addedPatient)
                        
                        listOfPat.document(patient.email.lowercased()).setData([
                            "email": patient.email.lowercased(),
                        ]) { err in
                            if let err = err {
                                print("Error writing document patient: \(err)")
                            } else {
                                print("Patient document successfully written!")
                            }
                        }
                        
                        self.docsPatientsScreen.tableViewPatients.reloadData()
                    case .failure(let error):
                        // A patient value could not be initialized from the DocumentSnapshot.
                        self.showErrorAlert(errorMessage: "Account does not exist. Please try again!")
                    }
                }
            }
        })
        
        //MARK: action buttons...
        addPatientAlert.addAction(addPatientAction)
        
        self.present(addPatientAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            addPatientAlert.view.superview?.isUserInteractionEnabled = true
            addPatientAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
    
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }
    
    func showErrorAlert(errorMessage: String){
        let alert = UIAlertController(title: "Error!", message: errorMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
}


