//
//  ViewController.swift
//  MVP
//
//  Created by tambanco 🥳 on 22.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}



extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        
    }
}
