//
//  PatientsDoctorsViewController.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import UIKit
import FirebaseFirestore

class PatientsDoctorsViewController: UIViewController {
    var patientsDocsScreen = PatientsDoctorsView()
    
    var doctors = [Doctor]()
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = patientsDocsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Doctors"
        
        updateDoctors()
        
        patientsDocsScreen.tableViewDoctors.delegate = self
        patientsDocsScreen.tableViewDoctors.dataSource = self
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }
    
    func updateDoctors(){
        doctors.removeAll()
        var docList = self.database.collection("patient").document(Configs.myEmail).collection("doctorsList")
        docList.getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    do {
                        var data = try document.data(as: DoctorsList.self)
                        var docInList = DoctorsList(email: data.email.lowercased())
                        
                        var docProf = self.database.collection("doctor").document(docInList.email)

                        docProf.getDocument(as: Doctor.self) { result in
                            switch result {
                            case .success(let doctor):
                                print("YAY")
                                // A patient value was successfully initialized from the DocumentSnapshot.
                                var addedDoctor = Doctor(name: doctor.name, email: doctor.email, phone: doctor.phone, specialty: doctor.specialty)
                                self.doctors.append(addedDoctor)
                                print(self.doctors)
                                
                                self.patientsDocsScreen.tableViewDoctors.reloadData()
                            case .failure(let error):
                                // A patient value could not be initialized from the DocumentSnapshot.
                                self.showErrorAlert(errorMessage: "Account does not exist. Please try again!")
                            }
                        }
                    }
                    catch {
                        print("Could not decode doclist")
                    }
                }
            }
        }
    }
    
    
    @objc func onAddBarButtonTapped(){
        let addDoctorAlert = UIAlertController(
            title: "Add Doctor",
            message: "Please enter doctors email",
            preferredStyle: .alert)
        
        //MARK: setting up email textField in the alert...
        addDoctorAlert.addTextField{ textField in
            textField.placeholder = "Enter email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        //MARK: Sign In Action...
        let addDoctorAction = UIAlertAction(title: "Add", style: .default, handler: {(_) in
            if let email = addDoctorAlert.textFields![0].text{
                if !email.isEmpty {
                    var docProf = self.database.collection("doctor").document(email)
                    var listOfDoc = self.database.collection("patient").document(Configs.myEmail).collection("doctorsList")
                    
                    var listOfPat = self.database.collection("doctor").document(email).collection("patientsList")
                    
                    listOfPat.document(Configs.myEmail.lowercased()).setData([
                        "email": Configs.myEmail.lowercased(),
                    ]) { err in
                        if let err = err {
                            print("Error writing document adding patient to doc list: \(err)")
                        } else {
                            print("Patients adding to doc document successfully written!")
                        }
                    }
                    
                    docProf.getDocument(as: Doctor.self) { result in
                        switch result {
                        case .success(let doctor):
                            print("YAY")
                            // A doctor value was successfully initialized from the DocumentSnapshot.
                            var addedDoctor = Doctor(name: doctor.name, email: doctor.email, phone: doctor.phone, specialty: doctor.specialty)
                            self.doctors.append(addedDoctor)
                            
                            listOfDoc.document(doctor.email.lowercased()).setData([
                                "email": doctor.email.lowercased(),
                            ]) { err in
                                if let err = err {
                                    print("Error writing document doctor: \(err)")
                                } else {
                                    print("Doctor document successfully written!")
                                }
                            }
                            
                            self.patientsDocsScreen.tableViewDoctors.reloadData()
                        case .failure(let error):
                            // A patient value could not be initialized from the DocumentSnapshot.
                            self.showErrorAlert(errorMessage: "Account does not exist. Please try again!")
                        }
                    }
                }
                else {
                    self.showErrorAlert(errorMessage: "Email cannot be empty")
                }
            }
        })
        
        //MARK: action buttons...
        addDoctorAlert.addAction(addDoctorAction)
        
        self.present(addDoctorAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            addDoctorAlert.view.superview?.isUserInteractionEnabled = true
            addDoctorAlert.view.superview?.addGestureRecognizer(
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


