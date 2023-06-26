//
//  SymptomsTableViewControllerController.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit

extension SymptomsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.symList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewSymptomsID, for: indexPath) as! SymptomsTableViewCell
        cell.labelName.text = symList[indexPath.row].name
        cell.labelIntensity.text = symList[indexPath.row].intensity
        cell.labelTimeframe.text = symList[indexPath.row].timeFrame
        cell.labelDuration.text = symList[indexPath.row].duration
        
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
                                            self.deleteSelectedFor(symptom: self.symList[indexPath.row])
                                        })
                                    ])
        
        //MARK: setting the button as an accessory of the cell...
        cell.accessoryView = buttonOptions
        return cell
    }
    

    func deleteSelectedFor(symptom: Symptom){
        if let email = self.delegate.currentUser?.email {
            let listofSymp = self.delegate.database.collection("patient").document(email).collection("symptoms")
            
            listofSymp.document(SymptomID.generateUniqueID(from: symptom)).delete() { err in
                if let err = err {
                    listofSymp.document(symptom.name).delete() { err in
                        if let err = err {
                            print("Error removing patient document: \(err)")
                        } else {
                            print("Patient document successfully removed!")
                        }
                    }
                } else {
                    print("Patient document successfully removed!")
                }
            }
            
        }else {
            print("No user found!")
        }
    }
}

