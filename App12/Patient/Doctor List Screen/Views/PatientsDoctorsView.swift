//
//  PatientsDoctorsView.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import UIKit

class PatientsDoctorsView: UIView {
    //    var contentWrapper:UIScrollView!
    var tableViewDoctors: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //        setupContentWrapper()
        setupTableViewDoctors()
        initConstraints()
    }
    
    //    func setupContentWrapper(){
    //        contentWrapper = UIScrollView()
    //        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
    //        self.addSubview(contentWrapper)
    //    }
    
    //    func setupTableViewDoctors(){
    //        tableViewDoctors = UITableView()
    //        tableViewDoctors.register(PatientsDocsTableViewCell.self, forCellReuseIdentifier: "doctors")
    //        tableViewDoctors.translatesAutoresizingMaskIntoConstraints = false
    //        contentWrapper.addSubview(tableViewDoctors)
    //    }
    
    func setupTableViewDoctors(){
        tableViewDoctors = UITableView()
        tableViewDoctors.register(PatientsDocsTableViewCell.self, forCellReuseIdentifier: "doctors")
        tableViewDoctors.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewDoctors)
    }
    
    //MARK: setting the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            //            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            //            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            //            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            //            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            //            tableViewDoctors.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 8),
            //            tableViewDoctors.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -8),
            //            tableViewDoctors.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 8),
            //            tableViewDoctors.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -8),
            
            tableViewDoctors.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewDoctors.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewDoctors.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewDoctors.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
