//
//  DoctorsPatientsView.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import UIKit

class DoctorsPatientsView: UIView {
//    var contentWrapper:UIScrollView!
    var tableViewPatients: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
//        setupContentWrapper()
        setupTableViewPatients()
        initConstraints()
    }
    
//    func setupContentWrapper(){
//        contentWrapper = UIScrollView()
//        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(contentWrapper)
//    }
    
//    func setupTableViewPatients(){
//        tableViewPatients = UITableView()
//        tableViewPatients.register(DocsPatientsTableViewCell.self, forCellReuseIdentifier: "patients")
//        tableViewPatients.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(tableViewPatients)
//    }
    
    func setupTableViewPatients(){
        tableViewPatients = UITableView()
        tableViewPatients.register(DocsPatientsTableViewCell.self, forCellReuseIdentifier: "patients")
        tableViewPatients.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewPatients)
    }
    
    //MARK: setting the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
//            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
//            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
//            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
//            tableViewPatients.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 8),
//            tableViewPatients.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -8),
//            tableViewPatients.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 8),
//            tableViewPatients.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -8),
            
            tableViewPatients.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewPatients.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewPatients.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewPatients.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

