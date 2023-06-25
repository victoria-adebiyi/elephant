//
//  SymptomsViewController.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import UIKit
import FirebaseFirestore

class SymptomsViewController: UIViewController {
    var delegate:PLPViewController!
    
    let symScreen = SymptomsView()
    
    var symList = [Symptom]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Symptoms"
        
        //MARK: patching table view delegate and data source...
        symScreen.tableViewSymptoms.delegate = self
        symScreen.tableViewSymptoms.dataSource = self
        
        //MARK: removing the separator line...
        symScreen.tableViewSymptoms.separatorStyle = .none
    }
    
    override func loadView() {
        view = symScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let barAddSymptom = UIBarButtonItem(
            image: .add,
            style: .plain,
            target: self,
            action: #selector(onAddSymButtonTapped))
        
        delegate.database.collection("patient")
            .document((delegate.currentUser?.email)!)
            .collection("symptoms")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.symList.removeAll()
                    for document in documents{
                        print("\(document): Going through document list...")
                        do{
                            let medication  = try document.data(as: Symptom.self)
                            self.symList.append(medication)
                            print("Appended medication to list")
                        }catch{
                            print(error)
                        }
                    }
                    self.symList.sort(by: {$0.timeStart < $1.timeStart})
                    self.symScreen.tableViewSymptoms.reloadData()
                }
            })

        
        self.navigationItem.rightBarButtonItem = barAddSymptom
    }
    
    @objc func onAddSymButtonTapped() {
        let addSymView = AddSymptomsViewController()
        addSymView.delegate = delegate
        self.navigationController?.pushViewController(addSymView, animated: true)
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

