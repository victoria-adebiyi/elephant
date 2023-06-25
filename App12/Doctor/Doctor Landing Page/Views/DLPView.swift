//
//  DLPView.swift
//  App12
//
//  Created by Eden Gugsa on 6/23/23.
//

import UIKit

class DLPView: UIView {
    var contentWrapper: UIScrollView!
    var profilePic: UIImageView!
    var buttonEditPFP: UIButton!
    var labelName: UILabel!
    var labelSpecialty: UILabel!
    var buttonPatients: UIButton!
//    var tableViewContacts: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupProfilePic()
        setupLabelName()
        setupLabelSpecialty()
        setupButtonEditPFP()
        setupButtonPatients()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.isScrollEnabled = true
        contentWrapper.showsVerticalScrollIndicator = true
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupProfilePic(){
        profilePic = UIImageView()
        profilePic.image = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal)
        profilePic.contentMode = .scaleToFill
        profilePic.clipsToBounds = true
        profilePic.layer.masksToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(profilePic)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.text = "John Doe"
        labelName.font = .systemFont(ofSize: 20)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelName)
    }
    
    func setupLabelSpecialty(){
        labelSpecialty = UILabel()
        labelSpecialty.text = "Cardiologist"
        labelSpecialty.font = .systemFont(ofSize: 14)
        labelSpecialty.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelSpecialty)
    }
    
    func setupButtonEditPFP(){
        buttonEditPFP = UIButton(type: .system)
        buttonEditPFP.setTitle("Edit", for: .normal)
        buttonEditPFP.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonEditPFP)
    }
    
    func setupButtonPatients(){
        buttonPatients = UIButton(type: .system)
        var config = UIButton.Configuration.gray()
        config.background.strokeColor = .darkGray
        config.background.strokeWidth = 1.0
        config.baseForegroundColor = .black
        config.titleAlignment = .center
        config.title = "Patients"
        config.buttonSize = .large
        buttonPatients.setTitle("Patients", for: .normal)
        buttonPatients.configuration = config
        buttonPatients.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonPatients)
    }
    
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            profilePic.widthAnchor.constraint(equalToConstant: 150),
            profilePic.heightAnchor.constraint(equalToConstant: 150),
            profilePic.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            profilePic.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            
            buttonEditPFP.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 8),
            buttonEditPFP.centerXAnchor.constraint(equalTo: profilePic.centerXAnchor),
            
            labelName.centerYAnchor.constraint(equalTo: profilePic.centerYAnchor),
            labelName.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 32),
            
            labelSpecialty.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelSpecialty.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 24),
            
            buttonPatients.widthAnchor.constraint(equalToConstant: 150),
            buttonPatients.heightAnchor.constraint(equalToConstant: 75),
            buttonPatients.topAnchor.constraint(equalTo: buttonEditPFP.bottomAnchor, constant: 40),
            buttonPatients.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonPatients.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



