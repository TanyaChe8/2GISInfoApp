//
//  InfoViewController.swift
//  2GISInfoApp
//
//  Created by Черненко Татьяна Анатольевна on 31.03.2022.
//

import UIKit

class InfoViewController: UITableViewController {
	private var infoList = Info.getInfoList()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		infoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
		let infoCell = infoList[indexPath.row]
		var content = cell.defaultContentConfiguration()
		content.text = infoCell.header
		cell.contentConfiguration = content
		return cell
    }
	
	// MARK: – Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let infoResultVC = segue.destination as? InfoResultViewController else { return }
		guard let indexPath = tableView.indexPathForSelectedRow else { return }
		infoResultVC.helpItem = infoList[indexPath.row]
	}

	@IBAction func backButtonPressed(_ sender: Any) {
		dismiss(animated: true)
	}
}
