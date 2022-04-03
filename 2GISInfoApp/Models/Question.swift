//
//  Question.swift
//  2GISInfoApp
//
//  Created by Черненко Татьяна Анатольевна on 01.04.2022.
//

import UIKit

struct Question {
	let title: String
	let responseType: ResponseType
	let answers: [Answer]
	
	static func getQuestions() -> [Question] {
		[
			Question(
				title: "Как вы любите проводить вечер пятницы?",
				responseType: .single,
				answers: [
					Answer(title: "В шумной компании друзей", city: .rome),
					Answer(title: "Дома с семьей", city: .london),
					Answer(title: "Заниматься хобби", city: .oslo),
					Answer(title: "За работой", city: .moscow)
				]
			),
			Question(
				title: "Как бы вы описали дом своей мечты?",
				responseType: .multiple,
				answers: [
					Answer(title: "Небольшой коттедж с собственным садом", city: .oslo),
					Answer(title: "Комфортабельная квартира на 20-м этаже", city: .moscow),
					Answer(title: "Маленькая уютная и светлая квартира", city: .london),
					Answer(title: "Старый дом с интересной историей", city: .rome)
				]
			),
			Question(
				title: "Нравится ли вам ритм жизни в крупных городах?",
				responseType: .ranged,
				answers: [
					Answer(title: "Не люблю", city: .oslo),
					Answer(title: "Отношусь нейтрально", city: .rome),
					Answer(title: "Скорее да", city: .london),
					Answer(title: "Обожаю!", city: .moscow)
				]
			)
		]
	}
}

enum ResponseType {
	case single
	case multiple
	case ranged
}

struct Answer {
	let title: String
	let city: City
}

enum City: String {
	case london = "Лондон 🎡"
	case moscow = "Москва 🏙"
	case oslo = "Осло 🏡"
	case rome = "Рим 🏛"
	
	var definition: String {
		switch self {
		case .london:
			return "Вы собранны и сдержанны. Безрассудству всегда предпочтете рациональный подход."
		case .moscow:
			return "Вам нравится бешеный ритм мегаполиса, вы никогда не сидите без дела!"
		case .oslo:
			return "Вы цените одиночество, ритм вашей жизни очень спокойный и размеренный"
		case .rome:
			return "Вы любите историю и искусство, цените живое общение"
		}
	}
}
