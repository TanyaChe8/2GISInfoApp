//
//  HybridViewController.swift
//  2GISInfoApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 27.03.2022.
//

import UIKit

class HybridViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func installButtonPressed() {
        performSegue(withIdentifier: "lastVC", sender: nil)
    }
    
    
    @IBAction func closeScreenButton(_ sender: Any) {
        dismiss(animated: true )
    }
    
    // MARK: - Navigation

    

}
