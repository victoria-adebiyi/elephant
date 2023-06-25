//
//  EditPFPView.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/25/23.
//

import UIKit

class EditPFPView: UIView {
    var labelPhoto:UILabel!
    var buttonTakePhoto: UIButton!
    var buttonSubmit: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelPhoto()
        setupButtonTakePhoto()
        setupButtonSubmit()
        
        initConstraints()
    }
    
    func setupLabelPhoto(){
        labelPhoto = UILabel()
        labelPhoto.text = "Edit Profile Photo"
        labelPhoto.font = UIFont.boldSystemFont(ofSize: 14)
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoto)
    }
    
    func setupButtonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        //buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    
    func setupButtonSubmit(){
        buttonSubmit = UIButton(type: .system)
        buttonSubmit.setTitle("Submit", for: .normal)
        buttonSubmit.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSubmit.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSubmit)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 200),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 200),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
            labelPhoto.bottomAnchor.constraint(equalTo: buttonTakePhoto.topAnchor, constant: 8),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonSubmit.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 8),
            buttonSubmit.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }

}
