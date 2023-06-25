//
//  PatientProfileViewController.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import UIKit

class PatientProfileViewController: UIViewController {
    var docsPatientsControl:DoctorsPatientsViewController!
    var patientProfileScreen = PatientProfileView()
    
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
        let removeAlert = UIAlertController(title: "Remove Patient!", message: "Are you sure want to remove patient?", preferredStyle: .actionSheet)
        removeAlert.addAction(UIAlertAction(title: "Yes, remove!", style: .default, handler: {(_) in
            print(self.docsPatientsControl.patients.count)
            print(self.patIdx)
            self.docsPatientsControl.patients.remove(at: self.patIdx)
            self.docsPatientsControl.docsPatientsScreen.tableViewPatients.reloadData()
            self.navigationController?.popViewController(animated: true)
            })
        )
        removeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(removeAlert, animated: true)
    }

}
