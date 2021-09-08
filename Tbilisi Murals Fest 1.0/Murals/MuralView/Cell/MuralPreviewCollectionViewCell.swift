//
//  MuralPreviewCollectionViewCell.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 14.12.20.
//

import UIKit

class MuralPreviewCollectionViewCell: UICollectionViewCell {
	
    // MARK: - Outlets
    @IBOutlet var imageView: UIImageView!
    
    // Properties
    public static let reuseIdentifier = "MuralImageCollectionViewCell"
    
    // MARK: - Configure
    func configure(with model: Model) {
        imageView.image = model.image
    }
}
