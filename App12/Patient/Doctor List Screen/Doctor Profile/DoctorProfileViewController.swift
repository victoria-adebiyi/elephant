//
//  DoctorProfileViewController.swift
//  App12
//
//  Created by Eden Gugsa on 6/25/23.
//

import UIKit

class DoctorProfileViewController: UIViewController {
    var patientsDocsControl:PatientsDoctorsViewController!
    var doctorProfileScreen = DoctorProfileView()
    
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
            self.patientsDocsControl.doctors.remove(at: self.patIdx)
            self.patientsDocsControl.patientsDocsScreen.tableViewDoctors.reloadData()
            self.navigationController?.popViewController(animated: true)
            })
        )
        removeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(removeAlert, animated: true)
    }


}
