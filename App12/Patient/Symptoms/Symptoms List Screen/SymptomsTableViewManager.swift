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
        return cell
    }
    

}

