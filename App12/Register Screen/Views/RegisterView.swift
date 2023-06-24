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
    
    func setupbuttonRegister(){
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            pickerUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            pickerUser.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            pickerUser.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldName.topAnchor.constraint(equalTo: pickerUser.bottomAnchor, constant: 16),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            textFieldPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPhone.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldAoS.topAnchor.constraint(equalTo: textFieldPhone.bottomAnchor, constant: 16),
            textFieldAoS.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldAoS.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldAoS.bottomAnchor, constant: 16),
            textFieldPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            buttonRegister.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 32),
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
