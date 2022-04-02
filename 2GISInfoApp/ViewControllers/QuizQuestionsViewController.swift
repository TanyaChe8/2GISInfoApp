//
//  QuizQuestionsViewController.swift
//  2GISInfoApp
//
//  Created by Черненко Татьяна Анатольевна on 01.04.2022.
//

import UIKit

class QuizQuestionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	@IBAction func resultsButtonPressed(_ sender: Any) {
		performSegue(withIdentifier: "QuizResults", sender: nil)
	}
	
}
