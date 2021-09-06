//
//  ArtistsTableViewCell.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 27.06.21.
//

import UIKit

class ArtistsTableViewCell: UITableViewCell {
    
    public static let reuseIdentifier = "ArtistsTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var profilePhotoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Configure
    func configure(with model: Model) {
        profilePhotoView.image = model.profilePhoto
        nameLabel.text = model.name
    }
}
