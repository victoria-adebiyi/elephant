//
//  PatientsTableViewManager.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import Foundation
import UIKit

extension DoctorsPatientsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.patients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "patients", for: indexPath) as! DocsPatientsTableViewCell
        
        cell.labelPatientsName.text = self.patients[indexPath.row].name
        cell.labelPatientsAge.text = "Age: \(self.patients[indexPath.row].age)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let patientProf = PatientProfileViewController()
        patientProf.patIdx = indexPath.row
        print(self.patients.count)
        print(indexPath.row)
        
        let selected = self.patients[indexPath.row]
        
        patientProf.patientProfileScreen.patientNameLabel.text = selected.name
        patientProf.patientProfileScreen.patientAgeLabel.text = "Age: \(selected.age)"
        patientProf.patientProfileScreen.patientEmailLabel.text = "Email: \(selected.email)"
        patientProf.patientProfileScreen.patientPhoneLabel.text = "Phone: \(selected.phone)"
        patientProf.docsPatientsControl = self
        navigationController?.pushViewController(patientProf, animated: true)
    }
}

