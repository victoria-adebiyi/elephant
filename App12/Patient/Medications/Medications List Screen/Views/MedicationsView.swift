//
//  MedicationsView.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit

class MedicationsView: UIView {
    var tableViewMedications: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTableViewMedications()
        initConstraints()
    }
    
    func setupTableViewMedications(){
        tableViewMedications = UITableView()
        tableViewMedications.register(MedicationsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewMedicationsID)
        tableViewMedications.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewMedications)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            tableViewMedications.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            tableViewMedications.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            tableViewMedications.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableViewMedications.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
