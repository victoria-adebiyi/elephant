//
//  MedicationsTableViewController.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit

extension MedicationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewMedicationsID, for: indexPath) as! MedicationsTableViewCell
        cell.labelName.text = medList[indexPath.row].name
        if let schedule = medList[indexPath.row].schedule {
            cell.labelSchedule.text = "Schedule: Take " + schedule
        }
        if let refill = medList[indexPath.row].refill {
            cell.labelNextRefill.text = "Next refill: " + refill
        }
        //Edit/Delete Accessory View
        //MARK: crating an accessory button...
        let buttonOptions = UIButton(type: .system)
        buttonOptions.contentMode = .scaleAspectFill
        buttonOptions.sizeToFit()
        buttonOptions.showsMenuAsPrimaryAction = true
        //MARK: setting an icon from sf symbols...
        buttonOptions.setImage(UIImage(systemName: "xmark"), for: .normal)
        buttonOptions.clipsToBounds = true
        
        //MARK: setting up menu for button options click...
        buttonOptions.menu = UIMenu(title: "Delete?",
                                    children: [
                                        UIAction(title: "Yes, Delete this item",attributes: .destructive,handler: {(_) in
                                            self.deleteSelectedFor(medication: self.medList[indexPath.row])
                                        })
                                    ])
        
        //MARK: setting the button as an accessory of the cell...
        cell.accessoryView = buttonOptions
        return cell
    }
    

    func deleteSelectedFor(medication: Medication){
        let listofMed = database.collection("patient").document(patientEmail).collection("medications")
            
        listofMed.document(medication.name).delete() { err in
            if let err = err {
                print("Error removing patient document: \(err)")
            } else {
                print("Patient document successfully removed!")
            }
        }
            
    }

    

}

