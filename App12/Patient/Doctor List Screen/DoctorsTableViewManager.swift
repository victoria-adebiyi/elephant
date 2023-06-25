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
        cell.labelDoctorsSpecialty.text = "Age: \(self.doctors[indexPath.row].specialty)"
        
        return cell
    }
}
