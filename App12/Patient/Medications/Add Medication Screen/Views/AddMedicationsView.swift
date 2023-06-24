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
        labelSchedule.text = "How often do you take this medication?"
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
    
    func setupDatePickerScheduleTime() {
        datePickerNextRefill = UIDatePicker()
        datePickerNextRefill.datePickerMode = .time
        datePickerNextRefill.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerNextRefill)
    }
    
    func setupLabelNextRefill() {
        labelSchedule = UILabel()
        labelSchedule.text = "Next Refill Date"
        labelSchedule.font = .boldSystemFont(ofSize: 16)
        labelSchedule.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSchedule)
    }
    
    func setupDatePickerNextRefill() {
        datePickerNextRefill = UIDatePicker()
        datePickerNextRefill.datePickerMode = .dateAndTime
        datePickerNextRefill.minimumDate = .now
        datePickerNextRefill.maximumDate = .distantFuture
        datePickerNextRefill.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerNextRefill)
    }
    
    func setupButtonSubmitMedication() {
        buttonSubmitMedication = UIButton()
        buttonSubmitMedication.setTitle("Submit", for: .normal)
        buttonSubmitMedication.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSubmitMedication)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
