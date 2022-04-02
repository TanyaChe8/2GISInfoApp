//
//  QuizQuestionsViewController.swift
//  2GISInfoApp
//
//  Created by Черненко Татьяна Анатольевна on 01.04.2022.
//

import UIKit

class QuizQuestionsViewController: UIViewController {
	
	@IBOutlet var questionProgressView: UIProgressView!
	@IBOutlet var questionLabel: UILabel!
	
	@IBOutlet var singleSrackView: UIStackView!
	@IBOutlet var singleButtons: [UIButton]!
	
	@IBOutlet var multipleStackView: UIStackView!
	@IBOutlet var multipleLabels: [UILabel]!
	@IBOutlet var multipleSwitches: [UISwitch]!
	
	@IBOutlet var rangedStackView: UIStackView!
	@IBOutlet var rangedLabels: [UILabel]!
	@IBOutlet var rangedSlider: UISlider! {
		didSet {
			let answerCount = Float(currentAnswers.count - 1)
			rangedSlider.maximumValue = answerCount
			rangedSlider.value = answerCount / 2
		}
	}
	
	private let questions = Question.getQuestions()
	private var questionIndex = 0
	private var answersChosen: [Answer] = []
	private var currentAnswers: [Answer] {
		questions[questionIndex].answers
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateUI()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let resultsVC = segue.destination as? QuizResultViewController else { return }
		resultsVC.answersChosen = answersChosen
	}
	
	@IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
		guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
		let currentAnswer = currentAnswers[currentIndex]
		answersChosen.append(currentAnswer)
		nextQuestion()
	}
	
	@IBAction func multipleAnswerButtonPressed() {
		for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers){
			if multipleSwitch.isOn {
				answersChosen.append(answer)
			}
		}
		nextQuestion()
	}
	
	@IBAction func rangedAnswerButtonPressed() {
		let index = lrintf(rangedSlider.value)
		answersChosen.append(currentAnswers[index])
		nextQuestion()
	}
}

// MARK: - Private Methods
extension QuizQuestionsViewController {
	private func updateUI() {
		for stackView in [singleSrackView, multipleStackView, rangedStackView] {
			stackView?.isHidden = true
		}
		
		let currentQuestion = questions[questionIndex]
		
		questionLabel.text = currentQuestion.title
		
		let totalProgress = Float(questionIndex) / Float(questions.count)
		
		questionProgressView.setProgress(totalProgress, animated: true)
		
		title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
		
		showCurrentAnswers(for: currentQuestion.responseType)
	}

	private func showCurrentAnswers(for type: ResponseType){
		switch type {
		case .single: showSingleStackView(with: currentAnswers)
		case .multiple: showMultipleStackView(with: currentAnswers)
		case .ranged: showRangedStackView(with: currentAnswers)
		}
	}

	private func showSingleStackView(with answers: [Answer]){
		singleSrackView.isHidden = false
		
		for (button, answer) in zip(singleButtons, answers){
			button.setTitle(answer.title, for: .normal)
		}
		
	}
	
	private func showMultipleStackView(with answers: [Answer]){
		multipleStackView.isHidden = false
		
		for (label, answer) in zip(multipleLabels, answers){
			label.text = answer.title
		}
	}
	
	private func nextQuestion() {
		questionIndex += 1
		
		if questionIndex < questions.count {
			updateUI()
			return
		}
		performSegue(withIdentifier: "QuizResults", sender: nil)
	}
	
	private func showRangedStackView(with answers: [Answer]){
		rangedStackView.isHidden = false
		
		rangedLabels.first?.text = answers.first?.title
		rangedLabels.last?.text = answers.last?.title
	}
}
