//
//  ViewController.swift
//  MVP
//
//  Created by tambanco 🥳 on 22.01.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    // MARK: - IBOutlet
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MainTableViewCell.reuseId)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MainViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseId, for: indexPath) as? MainTableViewCell else { return UITableViewCell()}
        cell.titleLabel.text = "More"
        return cell
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        
    }
}
