//
//  InfoResultViewController.swift
//  2GISInfoApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 27.03.2022.
//

import UIKit

class InfoResultViewController: UIViewController {

	@IBOutlet weak var helpImageView: UIImageView!
	@IBOutlet weak var helpDescriptionLabel: UILabel!
	
	var helpItem: Info!

    override func viewDidLoad() {
        super.viewDidLoad()
		helpImageView.image = UIImage(named: "InfoImage")
		helpDescriptionLabel.text = helpItem.description
    }
	
}
