//
//  PLPView.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/22/23.
//

import UIKit

class PLPView: UIView {
    var contentWrapper: UIScrollView!
    var profilePic: UIImageView!
    var buttonEditPFP: UIButton!
    var labelName: UILabel!
    var labelAge: UILabel!
    var buttonMedication: UIButton!
    var buttonSymptoms: UIButton!
    var buttonDoctor: UIButton!
    var tableViewContacts: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupProfilePic()
        setupLabelName()
        setupLabelAge()
        setupButtonEditPFP()
        setupButtonMedication()
        setupButtonSymptoms()
        setupButtonDoctor()
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
        labelName.font = .systemFont(ofSize: 16)
        labelName.lineBreakMode = .byWordWrapping
        labelName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelName)
    }
    
    func setupLabelAge(){
        labelAge = UILabel()
        labelAge.text = "Age: 23"
        labelAge.font = .systemFont(ofSize: 14)
        labelAge.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelAge)
    }
    
    func setupButtonEditPFP(){
        buttonEditPFP = UIButton(type: .system)
        buttonEditPFP.setTitle("Edit", for: .normal)
        buttonEditPFP.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonEditPFP)
    }
    
    
    func setupButtonMedication(){
        buttonMedication = UIButton(type: .system)
        var config = UIButton.Configuration.gray()
        config.background.strokeColor = .darkGray
        config.background.strokeWidth = 1.0
        config.baseForegroundColor = .black
        config.titleAlignment = .center
        config.title = "Medication"
        config.buttonSize = .large
        buttonMedication.setTitle("Medication", for: .normal)
        buttonMedication.configuration = config
        buttonMedication.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonMedication)
    }
    
    func setupButtonSymptoms(){
        buttonSymptoms = UIButton(type: .system)
        var config = UIButton.Configuration.gray()
        config.background.strokeColor = .darkGray
        config.background.strokeWidth = 1.0
        config.baseForegroundColor = .black
        config.titleAlignment = .center
        config.title = "Symptoms"
        config.buttonSize = .large
        buttonSymptoms.setTitle("Symptoms", for: .normal)
        buttonSymptoms.configuration = config
        buttonSymptoms.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonSymptoms)
    }
    
    func setupButtonDoctor(){
        buttonDoctor = UIButton(type: .system)
        var config = UIButton.Configuration.gray()
        config.background.strokeColor = .darkGray
        config.background.strokeWidth = 1.0
        config.baseForegroundColor = .black
        config.titleAlignment = .center
        config.title = "Doctor"
        config.buttonSize = .large
        buttonDoctor.setTitle("Doctor", for: .normal)
        buttonDoctor.configuration = config
        buttonDoctor.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonDoctor)
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
            labelName.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -16),
            
            labelAge.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelAge.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 24),
            
            buttonMedication.widthAnchor.constraint(equalToConstant: 150),
            buttonMedication.heightAnchor.constraint(equalToConstant: 75),
            buttonMedication.topAnchor.constraint(equalTo: buttonEditPFP.bottomAnchor, constant: 32),
            buttonMedication.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor, constant: -80),
            
            buttonSymptoms.widthAnchor.constraint(equalToConstant: 150),
            buttonSymptoms.heightAnchor.constraint(equalToConstant: 75),
            buttonSymptoms.topAnchor.constraint(equalTo: buttonMedication.topAnchor),
            buttonSymptoms.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor, constant: 80),
            
            buttonDoctor.widthAnchor.constraint(equalToConstant: 150),
            buttonDoctor.heightAnchor.constraint(equalToConstant: 75),
            buttonDoctor.topAnchor.constraint(equalTo: buttonSymptoms.bottomAnchor, constant: 16),
            buttonDoctor.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonDoctor.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
