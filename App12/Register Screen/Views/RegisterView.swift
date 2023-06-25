//
//  RegisterView.swift
//  App12
//
//  Created by Sakib Miazi on 6/2/23.
//

import UIKit

class RegisterView: UIView {
    var pickerUser: UIPickerView!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhone: UITextField!
    var textFieldAoS: UITextField! // age or specialty
    var textFieldPassword: UITextField!
    var textFieldPasswordVerify: UITextField!
    var labelPhoto:UILabel!
    var buttonTakePhoto: UIButton!
    var buttonRegister: UIButton!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupPickerUser()
        setuptextFieldName()
        setuptextFieldEmail()
        setuptextFieldPhone()
        setuptextFieldAoS()
        setuptextFieldPassword()
        setuptextFieldPasswordVerify()
        setuplabelPhoto()
        setupbuttonTakePhoto()
        setupbuttonRegister()
        
        initConstraints()
    }
    
    func setupPickerUser(){
        pickerUser = UIPickerView()
        pickerUser.isUserInteractionEnabled = true
        pickerUser.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pickerUser)
    }
    
    func setuptextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.keyboardType = .default
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setuptextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setuptextFieldPhone(){
        textFieldPhone = UITextField()
        textFieldPhone.placeholder = "Phone"
        textFieldPhone.keyboardType = .phonePad
        textFieldPhone.borderStyle = .roundedRect
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhone)
    }
    
    func setuptextFieldAoS(){
        textFieldAoS = UITextField()
        textFieldAoS.placeholder = "Specialty"
        textFieldAoS.keyboardType = .numberPad
        textFieldAoS.borderStyle = .roundedRect
        textFieldAoS.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldAoS)
    }
    
    func setuptextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.textContentType = .password
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setuptextFieldPasswordVerify(){
        textFieldPasswordVerify = UITextField()
        textFieldPasswordVerify.placeholder = "Please input password again"
        textFieldPasswordVerify.textContentType = .password
        textFieldPasswordVerify.isSecureTextEntry = true
        textFieldPasswordVerify.borderStyle = .roundedRect
        textFieldPasswordVerify.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPasswordVerify)
    }
    
    func setuplabelPhoto(){
        labelPhoto = UILabel()
        labelPhoto.text = "Add Profile Photo"
        labelPhoto.font = UIFont.boldSystemFont(ofSize: 14)
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoto)
    }
    
    func setupbuttonTakePhoto(){
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
    
    func setupbuttonRegister(){
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            pickerUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -16),
            pickerUser.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            pickerUser.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldName.topAnchor.constraint(equalTo: pickerUser.bottomAnchor, constant: -8),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 8),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 8),
            textFieldPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPhone.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldAoS.topAnchor.constraint(equalTo: textFieldPhone.bottomAnchor, constant: 8),
            textFieldAoS.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldAoS.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldAoS.bottomAnchor, constant: 8),
            textFieldPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldPasswordVerify.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 8),
            textFieldPasswordVerify.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPasswordVerify.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: textFieldPasswordVerify.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            //MARK: setting buttonTakePhoto's height and width..
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            labelPhoto.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
    
            
            buttonRegister.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 32),
            buttonRegister.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    func swapAoS(){
        if textFieldAoS.placeholder == "Specialty" {
            textFieldAoS.placeholder = "Age"
            textFieldAoS.keyboardType = .numberPad
        }else {
            textFieldAoS.placeholder = "Specialty"
            textFieldAoS.keyboardType = .default
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
