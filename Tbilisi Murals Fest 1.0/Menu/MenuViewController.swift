//
//  MenuViewController.swift
//  Tbilisi Murals Fest
//
//  Created by Giga Khizanishvili on 5/26/20.
//  Copyright © 2020 Giga Khizanishvili. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    public static let identifier = "MenuViewController"

	@IBOutlet weak var sponsorsImage: UIImageView!
	@IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var artistsButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var contactsButton: UIButton!
    
    private lazy var menuButtons: [UIButton] = [
        mapButton,
        artistsButton,
        galleryButton,
        contactsButton
    ]
    
    private var sponsorsImages = SponsorsManager.getSponsorImageNames().map{ UIImage(named: $0) }
	private var sponsorIndex = 0

	override func viewDidLoad() {
		super.viewDidLoad()

		sponsorsImage.image = sponsorsImages[sponsorIndex]
		Timer.scheduledTimer(
            timeInterval: Constants.numSecondsForEachSponsor,
			target: self,
			selector: #selector(self.changeView),
			userInfo: nil,
			repeats: true
		)
	}

	@objc func changeView() {
		sponsorsImage.image = sponsorsImages[sponsorIndex]
		sponsorIndex = (sponsorIndex + 1) % sponsorsImages.count
	}

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for button in menuButtons {
            button.layer.cornerRadius = 7.5
            button.layer.masksToBounds = true
        }
    }
}
