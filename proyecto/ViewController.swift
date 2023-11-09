//
//  ViewController.swift
//  proyecto
//
//  Created by Ricardo Alvarado Huamani on 8/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSigup: UIButton!
    
    override func viewDidLoad() {
        btnSigup.layer.borderWidth = 1
        btnSigup.layer.borderColor = UIColor(red:255/255,green:149/255,blue:0/255,alpha: 1).cgColor
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

