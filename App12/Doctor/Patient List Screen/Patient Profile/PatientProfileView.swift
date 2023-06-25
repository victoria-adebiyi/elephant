//
//  PatientProfileView.swift
//  App12
//
//  Created by Eden Gugsa on 6/24/23.
//

import UIKit

class PatientProfileView: UIView {
    var contentWrapper: UIScrollView!
    var profilePic: UIImageView!
    var patientNameLabel: UILabel!
    var patientEmailLabel: UILabel!
    var patientAgeLabel: UILabel!
    var patientPhoneLabel: UILabel!
    var patientMedicationsButton: UIButton!
    var patientSymptomsButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupProfilePic()
        setupPatientNameLabel()
        setupPatientEmailLabel()
        setupPatientAgeLabel()
        setupPatientPhoneLabel()
        setupPatientMedicationsButton()
        setupPatientSymptomsButton()
        initConstraints()
    }
    
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
    
    func setupPatientNameLabel(){
        patientNameLabel = UILabel()
        patientNameLabel.font = .systemFont(ofSize: 20)
        patientNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(patientNameLabel)
    }
    
    func setupPatientEmailLabel(){
        patientEmailLabel = UILabel()
        patientEmailLabel.font = .systemFont(ofSize: 20)
        patientEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(patientEmailLabel)
        
    }
    
    func setupPatientAgeLabel(){
        patientAgeLabel = UILabel()
        patientAgeLabel.font = .systemFont(ofSize: 20)
        patientAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(patientAgeLabel)
        
    }
    
    func setupPatientPhoneLabel(){
        patientPhoneLabel = UILabel()
        patientPhoneLabel.font = .systemFont(ofSize: 20)
        patientPhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(patientPhoneLabel)
        
    }
    
    func setupPatientMedicationsButton(){
        patientMedicationsButton = UIButton(type: .system)
        var config = UIButton.Configuration.gray()
        config.background.strokeColor = .darkGray
        config.background.strokeWidth = 1.0
        config.baseForegroundColor = .black
        config.titleAlignment = .center
        config.title = "Medications"
        config.buttonSize = .large
        patientMedicationsButton.setTitle("Medications", for: .normal)
        patientMedicationsButton.configuration = config
        patientMedicationsButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(patientMedicationsButton)
        
    }
    
    func setupPatientSymptomsButton(){
        patientSymptomsButton = UIButton(type: .system)
        var config = UIButton.Configuration.gray()
        config.background.strokeColor = .darkGray
        config.background.strokeWidth = 1.0
        config.baseForegroundColor = .black
        config.titleAlignment = .center
        config.title = "Symptoms"
        config.buttonSize = .large
        patientSymptomsButton.setTitle("Symptoms", for: .normal)
        patientSymptomsButton.configuration = config
        patientSymptomsButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(patientSymptomsButton)
        
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            profilePic.widthAnchor.constraint(equalToConstant: 150),
            profilePic.heightAnchor.constraint(equalToConstant: 150),
            profilePic.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            profilePic.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            
            patientNameLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            patientNameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 16),
            
            patientAgeLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            patientAgeLabel.topAnchor.constraint(equalTo: patientNameLabel.bottomAnchor, constant: 16),
            
            patientEmailLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            patientEmailLabel.topAnchor.constraint(equalTo: patientAgeLabel.bottomAnchor, constant: 16),
            
            patientPhoneLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            patientPhoneLabel.topAnchor.constraint(equalTo: patientEmailLabel.bottomAnchor, constant: 16),
            
            patientMedicationsButton.widthAnchor.constraint(equalToConstant: 150),
            patientMedicationsButton.heightAnchor.constraint(equalToConstant: 75),
            patientMedicationsButton.topAnchor.constraint(equalTo: patientPhoneLabel.bottomAnchor, constant: 32),
            patientMedicationsButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor, constant: -80),
            
            patientSymptomsButton.widthAnchor.constraint(equalToConstant: 150),
            patientSymptomsButton.heightAnchor.constraint(equalToConstant: 75),
            patientSymptomsButton.topAnchor.constraint(equalTo: patientMedicationsButton.topAnchor),
            patientSymptomsButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor, constant: 80),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

