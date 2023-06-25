//
//  AddMedicationViewController.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit
import FirebaseFirestore

class AddMedicationViewController: UIViewController {
    var delegate:MedicationsViewController!
    var patientEmail:String!
    let database = Firestore.firestore()
    let addMedView = AddMedicationsView()
    let scheduleFrequencies = ["Daily", "Weekly", "Monthly", "Other"]
    var selectedFrequency = "Daily"

    override func loadView() {
        view = addMedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Medication"
        // Do any additional setup after loading the view.
        self.addMedView.buttonSubmitMedication.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        
        self.addMedView.pickerScheduleFreq.delegate = self
        self.addMedView.pickerScheduleFreq.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if selectedFrequency == "Other" {
            self.addMedView.textScheduleFreq.isHidden = false
        } else {
            self.addMedView.textScheduleFreq.isHidden = true
        }
    }
    
    @objc func onButtonSubmitTapped() {
        print("Button Pressed")
        if let medicationName = self.addMedView.textMedName.text, self.addMedView.textMedName.text != "" {
            var scheduleString = ""
            if !self.addMedView.textScheduleFreq.isHidden {
                if let sched = self.addMedView.textScheduleFreq.text {
                    scheduleString = sched
                }
            } else {
                scheduleString = selectedFrequency
            }
            
            scheduleString += " at \(self.addMedView.datePickerScheduleTime.date.formatted(date:.omitted, time:.shortened))"
            
            let refillDate = self.addMedView.datePickerScheduleTime.date.formatted(date: .numeric, time: .omitted)

            let medication = Medication(name: medicationName, schedule: scheduleString, refill: refillDate)
            print("Sending to Firestore")
            self.saveChatToFireStore(medication: medication)
            
        } else {
            let errorAlert = UIAlertController(title: "Medication must have a Name!", message: "Please enter the name of the medication into the textbox", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(errorAlert, animated: true)
        }
    }
    
    //MARK: logic to add a contact to Firestore...
    func saveChatToFireStore(medication: Medication){
            do {
                try database.collection("patient").document(patientEmail).collection("medications").document(medication.name).setData(from: medication)
                delegate.navigationController?.popViewController(animated: true)
            } catch let error {
                print("Error writing medication to Firestore: \(error)")
            }
    }
}

extension AddMedicationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return scheduleFrequencies.count
    }
    
    //set the title of currently picked row...
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedFrequency = scheduleFrequencies[row]
        if selectedFrequency == "Other" {
            self.addMedView.textScheduleFreq.isHidden = false
        } else {
            self.addMedView.textScheduleFreq.isHidden = true
        }
        return scheduleFrequencies[row]
    }
}

