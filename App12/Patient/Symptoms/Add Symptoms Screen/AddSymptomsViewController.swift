//
//  AddSymptomsViewController.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit
import FirebaseFirestore

class AddSymptomsViewController: UIViewController {
    var delegate:PLPViewController!
    let database = Firestore.firestore()
    let addSympView = AddSymptomsView()
    let symptomScale = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var selectedSymptom = "5"

    override func loadView() {
        view = addSympView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Symptom"
        // Do any additional setup after loading the view.
        self.addSympView.buttonSubmitSymptom.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        
        self.addSympView.pickerScale.delegate = self
        self.addSympView.pickerScale.dataSource = self
    }
    
    @objc func onButtonSubmitTapped() {
        print("Button Pressed")
        if let symptomName = self.addSympView.textSympName.text, self.addSympView.textSympName.text != "" {
            let symptomIntensity = "Intensity: \(selectedSymptom)"
            let symptomStart = self.addSympView.datePickerStart.date
            let symptomEnd = self.addSympView.datePickerEnd.date
            let symptomRange = "Duration: \(symptomStart.formatted(date: .abbreviated, time: .shortened)) - \(symptomEnd.formatted(date: .abbreviated, time: .shortened))"
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .abbreviated
            formatter.allowedUnits = [.hour, .minute]
            let duration = formatter.string(from: symptomEnd.timeIntervalSince(symptomStart)) ?? "0m"

            let symptom = Symptom(name: symptomName, intensity: symptomIntensity, timeStart: symptomStart, timeFrame: symptomRange, duration: duration)
            print("Sending to Firestore")
            self.saveChatToFireStore(symptom: symptom)
            
        } else {
            let errorAlert = UIAlertController(title: "Symptom must have a Name!", message: "Please enter the describe the symptom you are experience in the textbox", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(errorAlert, animated: true)
        }
    }
    
    //MARK: logic to add a contact to Firestore...
    func saveChatToFireStore(symptom: Symptom){
        if let email = delegate.currentUser?.email {
            do {
                try database.collection("patient").document(email).collection("symptoms").document(symptom.name).setData(from: symptom)
                delegate.navigationController?.popViewController(animated: true)
            } catch let error {
                print("Error writing medication to Firestore: \(error)")
            }
        }
    }
}

extension AddSymptomsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return symptomScale.count
    }
    
    //set the title of currently picked row...
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedSymptom = symptomScale[row]
        return symptomScale[row]
    }
}

