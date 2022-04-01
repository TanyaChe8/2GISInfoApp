//
//  QuizResultViewController.swift
//  2GISInfoApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 27.03.2022.
//

import UIKit

class QuizResultViewController: UIViewController {

	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var cityInfoLabel: UILabel!
	
		var answersChosen: [Answer]!
		private var resultCity: City?
		
		override func viewDidLoad() {
			super.viewDidLoad()
			
			resultCity = getResults()
			cityLabel.text = "ВЫ - \(resultCity?.rawValue ?? "?")!"
			cityInfoLabel.text = resultCity?.definition ?? "?"
			
		}

		private func getResults() -> City? {
			var result: [City: Int] = [:]
			
			let cities = answersChosen.map { $0.city }
			for index in cities {
				result[index] = (result[index] ?? 0) + 1
			}
			return result.sorted { $0.value > $1.value }.first?.key
		}
	}
