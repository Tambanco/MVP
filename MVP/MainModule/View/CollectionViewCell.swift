//
//  CollectionViewCell.swift
//  MVP
//
//  Created by tambanco 🥳 on 26.01.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let reuseId = "CollectionViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}
