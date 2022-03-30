//
//  ViewController.swift
//  2GISInfoApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 27.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func firstPressedButton() {
        performSegue(withIdentifier: "TransitionMenuView", sender: nil)
    }
}

