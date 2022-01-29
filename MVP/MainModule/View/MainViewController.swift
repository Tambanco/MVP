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
    var mainCollectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    var layout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = UICollectionViewFlowLayout()
        mainCollectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: self.view.frame.width,
                                                            height: self.view.frame.height), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.width - 40,
                                 height: 300)
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        view.addSubview(mainCollectionView)
        
        let nib = UINib(nibName: CollectionViewCell.reuseId, bundle: nil)
        mainCollectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath)
        cell.backgroundColor = .yellow
        return cell 
    }
    
    
}



extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        
    }
}
