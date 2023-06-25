//
//  AddMedicationsView.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit

class AddMedicationsView: UIView {
    var labelMedName: UILabel!
    var textMedName: UITextField!
    var labelSchedule: UILabel!
    var pickerScheduleFreq: UIPickerView!
    var textScheduleFreq: UITextField!
    var datePickerScheduleTime: UIDatePicker!
    var labelNextRefill: UILabel!
    var datePickerNextRefill: UIDatePicker!
    var buttonSubmitMedication: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelMedName()
        setupTextMedName()
        setupLabelSchedule()
        setupPickerScheduleFreq()
        setupTextScheduleFreq()
        setupDatePickerScheduleTime()
        setupLabelNextRefill()
        setupDatePickerNextRefill()
        setupButtonSubmitMedication()
        
        initConstraints()
        
    }
    
    func setupLabelMedName() {
        labelMedName = UILabel()
        labelMedName.text = "Medication Name"
        labelMedName.font = .boldSystemFont(ofSize: 16)
        labelMedName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelMedName)
    }
    
    func setupTextMedName() {
        textMedName = UITextField()
        textMedName.placeholder = "Enter Name Here..."
        textMedName.keyboardType = .default
        textMedName.borderStyle = .roundedRect
        textMedName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textMedName)
    }
    
    func setupLabelSchedule() {
        labelSchedule = UILabel()
        labelSchedule.text = "When do you take this medication?"
        labelSchedule.font = .boldSystemFont(ofSize: 16)
        labelSchedule.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSchedule)
    }
    
    func setupPickerScheduleFreq() {
        pickerScheduleFreq = UIPickerView()
        pickerScheduleFreq.isUserInteractionEnabled = true
        pickerScheduleFreq.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pickerScheduleFreq)
    }
    
    func setupTextScheduleFreq() {
        textScheduleFreq = UITextField()
        textScheduleFreq.placeholder = "Enter frequency here..."
        textScheduleFreq.keyboardType = .default
        textScheduleFreq.borderStyle = .roundedRect
        textScheduleFreq.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textScheduleFreq)
    }
    
    func setupDatePickerScheduleTime() {
        datePickerScheduleTime = UIDatePicker()
        datePickerScheduleTime.datePickerMode = .time
        datePickerScheduleTime.preferredDatePickerStyle = .inline
        datePickerScheduleTime.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerScheduleTime)
    }
    
    func setupLabelNextRefill() {
        labelNextRefill = UILabel()
        labelNextRefill.text = "Next Refill Date"
        labelNextRefill.font = .boldSystemFont(ofSize: 16)
        labelNextRefill.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelNextRefill)
    }
    
    func setupDatePickerNextRefill() {
        datePickerNextRefill = UIDatePicker()
        datePickerNextRefill.datePickerMode = .date
        datePickerNextRefill.minimumDate = .now
        datePickerNextRefill.maximumDate = .distantFuture
        datePickerNextRefill.preferredDatePickerStyle = .compact
        datePickerNextRefill.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerNextRefill)
    }
    
    func setupButtonSubmitMedication() {
        buttonSubmitMedication = UIButton(type: .system)
        buttonSubmitMedication.setTitle("Add", for: .normal)
        buttonSubmitMedication.setImage(.add, for: .normal)
        buttonSubmitMedication.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonSubmitMedication.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSubmitMedication)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            labelMedName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelMedName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelMedName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textMedName.topAnchor.constraint(equalTo: labelMedName.bottomAnchor, constant: 8),
            textMedName.leadingAnchor.constraint(equalTo: labelMedName.leadingAnchor),
            textMedName.trailingAnchor.constraint(equalTo: labelMedName.trailingAnchor),
            
            labelSchedule.topAnchor.constraint(equalTo: textMedName.bottomAnchor, constant: 12),
            labelSchedule.leadingAnchor.constraint(equalTo: labelMedName.leadingAnchor),
            labelSchedule.trailingAnchor.constraint(equalTo: labelMedName.trailingAnchor),
            
            datePickerScheduleTime.topAnchor.constraint(equalTo: labelSchedule.bottomAnchor, constant: 8),
            datePickerScheduleTime.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            pickerScheduleFreq.topAnchor.constraint(equalTo: datePickerScheduleTime.bottomAnchor, constant: 8),
            pickerScheduleFreq.leadingAnchor.constraint(equalTo: labelMedName.leadingAnchor),
            pickerScheduleFreq.trailingAnchor.constraint(equalTo: labelMedName.trailingAnchor),
            
            textScheduleFreq.topAnchor.constraint(equalTo: pickerScheduleFreq.bottomAnchor, constant: -16),
            textScheduleFreq.leadingAnchor.constraint(equalTo: labelMedName.leadingAnchor),
            textScheduleFreq.trailingAnchor.constraint(equalTo: labelMedName.trailingAnchor),
            
            labelNextRefill.topAnchor.constraint(equalTo: textScheduleFreq.bottomAnchor, constant: 12),
            labelNextRefill.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            datePickerNextRefill.topAnchor.constraint(equalTo: labelNextRefill.bottomAnchor, constant: 8),
            datePickerNextRefill.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            buttonSubmitMedication.topAnchor.constraint(equalTo: datePickerNextRefill.bottomAnchor, constant: 16),
            buttonSubmitMedication.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

