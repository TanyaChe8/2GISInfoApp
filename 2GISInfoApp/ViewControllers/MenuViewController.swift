//
//  MenuViewController.swift
//  2GISInfoApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 27.03.2022.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func newInfoPressedButton() {
        performSegue(withIdentifier: "TransitionHybrid", sender: nil)
    }

    @IBAction func quizPressedButton() {
        performSegue(withIdentifier: "TransitionQuiz", sender: nil)
    }
    
    @IBAction func faqPressedButton() {
        performSegue(withIdentifier: "TransitionFAQ", sender: nil)
    }
    
    // MARK: - Navigation

  

}
