//
//  ArtistsCollectionViewCell.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 09.09.21.
//

import UIKit

class ArtistsCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var profilePhotoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Property
    static let reuseIdentifier = "ArtistsCollectionViewCell"
    
    // MARK: - Configure
    public func configure(with model: Model) {
        profilePhotoView.image = model.profilePhoto
        nameLabel.text = model.name
    }
}

extension ArtistsCollectionViewCell {
    struct Model {
        var name: String
        var profilePhoto: UIImage
    }
}
