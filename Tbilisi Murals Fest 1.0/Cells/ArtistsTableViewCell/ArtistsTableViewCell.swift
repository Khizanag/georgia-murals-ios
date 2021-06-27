//
//  ArtistsTableViewCell.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 27.06.21.
//

import UIKit

class ArtistsTableViewCell: UITableViewCell {
    
    public static let reuseId = "ArtistsTableViewCell"
    
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var name: UILabel!
    
}
