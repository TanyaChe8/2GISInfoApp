//
//  MenuViewController.swift
//  2GISInfoApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 27.03.2022.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func newInfoButtonPressed() {
        performSegue(withIdentifier: "TransitionHybrid", sender: nil)
    }

    @IBAction func quizButtonPressed() {
        performSegue(withIdentifier: "TransitionQuiz", sender: nil)
    }
    
    @IBAction func faqButtonPressed() {
        performSegue(withIdentifier: "TransitionFAQ", sender: nil)
    }
    
    // MARK: - Navigation

  

}
