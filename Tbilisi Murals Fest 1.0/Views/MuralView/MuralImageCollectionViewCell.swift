//
//  MuralImageCollectionViewCell.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 14.12.20.
//

import UIKit
import ScalingCarousel

class MuralImageCollectionViewCell: ScalingCarouselCell {
    public static let reuseId = "MuralImageCollectionViewCell"
	
    @IBOutlet var imageView: UIImageView!
}
