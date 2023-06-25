//
//  AddSymptomsView.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit

class AddSymptomsView: UIView {
    var labelSympName: UILabel!
    var textSympName: UITextField!
    var labelScale: UILabel!
    var pickerScale: UIPickerView!
    var labelDateExperienced: UILabel!
    var labelDateStart: UILabel!
    var labelDateEnd: UILabel!
    var datePickerStart: UIDatePicker!
    var datePickerEnd: UIDatePicker!
    var buttonSubmitSymptom: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelSympName()
        setupTextSympName()
        setupLabelScale()
        setupPickerScale()
        setupLabelDateExperienced()
        setupLabelDateStart()
        setupLabelDateEnd()
        setupDatePickerStart()
        setupDatePickerEnd()
        setupButtonSubmitSymptom()
        
        initConstraints()
        
    }
    
    func setupLabelSympName() {
        labelSympName = UILabel()
        labelSympName.text = "Symptom Name"
        labelSympName.font = .boldSystemFont(ofSize: 16)
        labelSympName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSympName)
    }
    
    func setupTextSympName() {
        textSympName = UITextField()
        textSympName.placeholder = "Enter Name Here..."
        textSympName.keyboardType = .default
        textSympName.borderStyle = .roundedRect
        textSympName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textSympName)
    }
    
    func setupLabelScale() {
        labelScale = UILabel()
        labelScale.text = "How intense is this symptom?"
        labelScale.font = .boldSystemFont(ofSize: 16)
        labelScale.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelScale)
    }
    
    func setupPickerScale() {
        pickerScale = UIPickerView()
        pickerScale.isUserInteractionEnabled = true
        pickerScale.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pickerScale)
    }
    
    func setupLabelDateExperienced() {
        labelDateExperienced = UILabel()
        labelDateExperienced.text = "When did you experience this symptom?"
        labelDateExperienced.font = .boldSystemFont(ofSize: 16)
        labelDateExperienced.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDateExperienced)
    }
    
    func setupLabelDateStart() {
        labelDateStart = UILabel()
        labelDateStart.text = "Time Start"
        labelDateStart.font = .systemFont(ofSize: 12)
        labelDateStart.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDateStart)
    }
    
    func setupLabelDateEnd() {
        labelDateEnd = UILabel()
        labelDateEnd.text = "Time End"
        labelDateEnd.font = .systemFont(ofSize: 12)
        labelDateEnd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDateEnd)
    }
    
    func setupDatePickerStart() {
        datePickerStart = UIDatePicker()
        datePickerStart.datePickerMode = .dateAndTime
        datePickerStart.preferredDatePickerStyle = .compact
        datePickerStart.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerStart)
    }
    
    func setupDatePickerEnd() {
        datePickerEnd = UIDatePicker()
        datePickerEnd.datePickerMode = .dateAndTime
        datePickerEnd.preferredDatePickerStyle = .compact
        datePickerEnd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerEnd)
    }
    
    func setupButtonSubmitSymptom() {
        buttonSubmitSymptom = UIButton(type: .system)
        buttonSubmitSymptom.setTitle("Add", for: .normal)
        buttonSubmitSymptom.setImage(.add, for: .normal)
        buttonSubmitSymptom.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonSubmitSymptom.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSubmitSymptom)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            labelSympName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelSympName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelSympName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textSympName.topAnchor.constraint(equalTo: labelSympName.bottomAnchor, constant: 8),
            textSympName.leadingAnchor.constraint(equalTo: labelSympName.leadingAnchor),
            textSympName.trailingAnchor.constraint(equalTo: labelSympName.trailingAnchor),
            
            labelScale.topAnchor.constraint(equalTo: textSympName.bottomAnchor, constant: 12),
            labelScale.centerXAnchor.constraint(equalTo: labelSympName.centerXAnchor),
            
            pickerScale.topAnchor.constraint(equalTo: labelScale.bottomAnchor, constant: 8),
            pickerScale.leadingAnchor.constraint(equalTo: labelSympName.leadingAnchor),
            pickerScale.trailingAnchor.constraint(equalTo: labelSympName.trailingAnchor),
            
            labelDateExperienced.topAnchor.constraint(equalTo: pickerScale.bottomAnchor, constant: 12),
            labelDateExperienced.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelDateStart.topAnchor.constraint(equalTo: labelDateExperienced.bottomAnchor, constant: 8),
            labelDateStart.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            datePickerStart.topAnchor.constraint(equalTo: labelDateStart.bottomAnchor, constant: 8),
            datePickerStart.centerXAnchor.constraint(equalTo: labelDateStart.centerXAnchor),
            
            labelDateEnd.topAnchor.constraint(equalTo: datePickerStart.bottomAnchor, constant: 12),
            labelDateEnd.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            datePickerEnd.topAnchor.constraint(equalTo: labelDateEnd.bottomAnchor, constant: 8),
            datePickerEnd.centerXAnchor.constraint(equalTo: labelDateEnd.centerXAnchor),
            
            buttonSubmitSymptom.topAnchor.constraint(equalTo: datePickerEnd.bottomAnchor, constant: 16),
            buttonSubmitSymptom.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

