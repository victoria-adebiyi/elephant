//
//  DoctorProfileViewController.swift
//  App12
//
//  Created by Eden Gugsa on 6/25/23.
//

import UIKit
import FirebaseFirestore

class DoctorProfileViewController: UIViewController {
    var patientsDocsControl:PatientsDoctorsViewController!
    var doctorProfileScreen = DoctorProfileView()
    
    let database = Firestore.firestore()
        
    var patIdx = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let barRemove = UIBarButtonItem(
            title: "Remove Doctor",
            style: .plain,
            target: self,
            action: #selector(onBarRemoveButtonTapped)
        )
        
        barRemove.tintColor = .red
        
        navigationItem.rightBarButtonItems = [barRemove]
    }
    
    override func loadView() {
        view = doctorProfileScreen
    }
    
    @objc func onBarRemoveButtonTapped(){
        let removeAlert = UIAlertController(title: "Remove Doctor", message: "Are you sure want to remove doctor?", preferredStyle: .actionSheet)
        removeAlert.addAction(UIAlertAction(title: "Yes, remove!", style: .default, handler: {(_) in
            print(self.patientsDocsControl.doctors.count)
            print(self.patIdx)
            var docEmail = self.patientsDocsControl.doctors[self.patIdx].email.lowercased()
            self.patientsDocsControl.doctors.remove(at: self.patIdx)
            
            var listOfDoc = self.database.collection("patient").document(Configs.myEmail).collection("doctorsList")
            
            listOfDoc.document(docEmail).delete() { err in
                if let err = err {
                    print("Error removing doctor document: \(err)")
                } else {
                    print("Doctor document successfully removed!")
                }
            }
            
            var listOfPat = self.database.collection("doctor").document(docEmail).collection("patientsList")
            
            listOfPat.document(Configs.myEmail.lowercased()).delete() { err in
                if let err = err {
                    print("Error removing patient from doc document list: \(err)")
                } else {
                    print("Patient document successfully removed from doc list!")
                }
            }
            
            self.patientsDocsControl.patientsDocsScreen.tableViewDoctors.reloadData()
            self.navigationController?.popViewController(animated: true)
            })
        )
        removeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(removeAlert, animated: true)
    }


}
