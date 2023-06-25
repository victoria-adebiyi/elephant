//
//  SymptomsView.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit

class SymptomsView: UIView {
    var tableViewSymptoms: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTableViewSymptoms()
        initConstraints()
    }
    
    func setupTableViewSymptoms(){
        tableViewSymptoms = UITableView()
        tableViewSymptoms.register(SymptomsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewSymptomsID)
        tableViewSymptoms.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewSymptoms)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            tableViewSymptoms.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            tableViewSymptoms.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            tableViewSymptoms.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableViewSymptoms.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

