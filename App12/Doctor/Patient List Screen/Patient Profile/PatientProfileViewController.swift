//
//  PatientProfileViewController.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import UIKit
import FirebaseFirestore

class PatientProfileViewController: UIViewController {
    var docsPatientsControl:DoctorsPatientsViewController!
    var patientProfileScreen = PatientProfileView()
    
    let database = Firestore.firestore()
    
    var patIdx = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barRemove = UIBarButtonItem(
            title: "Remove Patient",
            style: .plain,
            target: self,
            action: #selector(onBarRemoveButtonTapped)
        )
        
        barRemove.tintColor = .red
        
        navigationItem.rightBarButtonItems = [barRemove]
        

    }
    
    override func loadView() {
        view = patientProfileScreen
    }
    
    @objc func onBarRemoveButtonTapped(){
        let removeAlert = UIAlertController(title: "Remove Patient", message: "Are you sure want to remove patient?", preferredStyle: .actionSheet)
        removeAlert.addAction(UIAlertAction(title: "Yes, remove!", style: .default, handler: {(_) in
            print(self.docsPatientsControl.patients.count)
            print(self.patIdx)
            var patEmail = self.docsPatientsControl.patients[self.patIdx].email.lowercased()
            self.docsPatientsControl.patients.remove(at: self.patIdx)
            
            var listOfPat = self.database.collection("doctor").document(Configs.myEmail).collection("patientsList")
                        
            listOfPat.document(patEmail).delete() { err in
                if let err = err {
                    print("Error removing patient document: \(err)")
                } else {
                    print("Patient document successfully removed!")
                }
            }
            
            var listOfDoc = self.database.collection("patient").document(patEmail).collection("doctorsList")
            
            listOfDoc.document(Configs.myEmail.lowercased()).delete() { err in
                if let err = err {
                    print("Error removing doc from patient document list: \(err)")
                } else {
                    print("Doc document successfully removed from patient list!")
                }
            }
            
            self.docsPatientsControl.docsPatientsScreen.tableViewPatients.reloadData()
            self.navigationController?.popViewController(animated: true)
            })
        )
        removeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(removeAlert, animated: true)
    }

}

