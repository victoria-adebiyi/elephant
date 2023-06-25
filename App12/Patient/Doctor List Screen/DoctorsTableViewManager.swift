//
//  DoctorsTableViewManager.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import Foundation
import UIKit

extension PatientsDoctorsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.doctors.count)
        return self.doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doctors", for: indexPath) as! PatientsDocsTableViewCell
        
        cell.labelDoctorsName.text = self.doctors[indexPath.row].name
        cell.labelDoctorsSpecialty.text = "Specialty: \(self.doctors[indexPath.row].specialty)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let docProf = DoctorProfileViewController()
        docProf.patIdx = indexPath.row
        print(self.doctors.count)
        print(indexPath.row)
        
        let selected = self.doctors[indexPath.row]
        
        docProf.doctorProfileScreen.doctorNameLabel.text = selected.name
        docProf.doctorProfileScreen.doctorSpecialtyLabel.text = "Specialty: \(selected.specialty)"
        docProf.doctorProfileScreen.doctorEmailLabel.text = "Email: \(selected.email)"
        docProf.doctorProfileScreen.doctorPhoneLabel.text = "Phone: \(selected.phone)"
        docProf.patientsDocsControl = self
        navigationController?.pushViewController(docProf, animated: true)
    }
}

