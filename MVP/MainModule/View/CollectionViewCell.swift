//
//  CollectionViewCell.swift
//  MVP
//
//  Created by tambanco 🥳 on 29.01.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CollectionViewCell"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

}
