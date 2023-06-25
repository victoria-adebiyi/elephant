//
//  DoctorProfileView.swift
//  App12
//
//  Created by Eden Gugsa on 6/25/23.
//

import UIKit

class DoctorProfileView: UIView {
    var contentWrapper: UIScrollView!
    var profilePic: UIImageView!
    var doctorNameLabel: UILabel!
    var doctorEmailLabel: UILabel!
    var doctorSpecialtyLabel: UILabel!
    var doctorPhoneLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupProfilePic()
        setupDoctorNameLabel()
        setupDoctorEmailLabel()
        setupDoctorSpecialtyLabel()
        setupDoctorPhoneLabel()
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
    
    func setupDoctorNameLabel(){
        doctorNameLabel = UILabel()
        doctorNameLabel.font = .systemFont(ofSize: 20)
        doctorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(doctorNameLabel)
    }
    
    func setupDoctorEmailLabel(){
        doctorEmailLabel = UILabel()
        doctorEmailLabel.font = .systemFont(ofSize: 20)
        doctorEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(doctorEmailLabel)
        
    }
    
    func setupDoctorSpecialtyLabel(){
        doctorSpecialtyLabel = UILabel()
        doctorSpecialtyLabel.font = .systemFont(ofSize: 20)
        doctorSpecialtyLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(doctorSpecialtyLabel)
        
    }
    
    func setupDoctorPhoneLabel(){
        doctorPhoneLabel = UILabel()
        doctorPhoneLabel.font = .systemFont(ofSize: 20)
        doctorPhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(doctorPhoneLabel)
        
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
            
            doctorNameLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            doctorNameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 16),
            
            doctorSpecialtyLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            doctorSpecialtyLabel.topAnchor.constraint(equalTo: doctorNameLabel.bottomAnchor, constant: 16),
            
            doctorEmailLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            doctorEmailLabel.topAnchor.constraint(equalTo: doctorSpecialtyLabel.bottomAnchor, constant: 16),
            
            doctorPhoneLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            doctorPhoneLabel.topAnchor.constraint(equalTo: doctorEmailLabel.bottomAnchor, constant: 16),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

