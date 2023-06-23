//
//  DLPViewController.swift
//  App12
//
//  Created by Eden Gugsa on 6/23/23.
//

import UIKit

class DLPViewController: UIViewController {

    var dlpScreen = DLPView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = dlpScreen
    }

}
