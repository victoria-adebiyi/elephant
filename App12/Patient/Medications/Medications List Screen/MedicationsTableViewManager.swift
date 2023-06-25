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
        return cell
    }
    

}

