//
//  ViewController.swift
//  MVP
//
//  Created by tambanco 🥳 on 22.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
    var mainCollectionView: UICollectionView! = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        mainCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        let nib = UINib(nibName: CollectionViewCell.reuseId, bundle: nil)
        mainCollectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.pastaInfo?.count ?? 0
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as! CollectionViewCell
        let pastaInfo = presenter.pastaInfo?[indexPath.row]
         cell.titleLabel.text = pastaInfo?.name
         cell.descriptionLabel.text = pastaInfo?.text
        return cell
    }
}

extension MainViewController: MainViewProtocol {
    func success() {
        mainCollectionView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
