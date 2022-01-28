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
        return 7
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as! CollectionViewCell
        cell.titleLabel.text = "Капеллини"
        cell.descriptionLabel.text = "Так называют самую тонкую пасту, придуманную в центре Северной Италии. Она же — капеллини (capellini). Варить ее нужно буквально 3–4 минуты — сильно меньше, чем обычные спагетти. Лучше всего паста сочетается с очень легкими соусами и морепродуктами."
        cell.imgView.image = UIImage(named: "campanelle.jpg")
        return cell
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        
    }
}
