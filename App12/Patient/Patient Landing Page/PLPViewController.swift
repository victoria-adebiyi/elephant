//
//  PLPViewController.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/22/23.
//

import UIKit

class PLPViewController: UIViewController {
    var plpScreen = PLPView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = plpScreen
    }

}
