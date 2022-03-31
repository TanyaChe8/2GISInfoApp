//
//  ViewController.swift
//  2GISInfoApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 27.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func startButtonPressed() {
        performSegue(withIdentifier: "TransitionMenuView", sender: nil)
    }
}

