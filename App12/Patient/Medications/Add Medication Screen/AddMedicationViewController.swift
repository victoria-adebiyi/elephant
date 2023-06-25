//
//  AddMedicationViewController.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit

class AddMedicationViewController: UIViewController {
    let addMedView = MedicationsView()

    override func loadView() {
        view = addMedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //MARK: Observe Firestore database to display the contacts list...

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
