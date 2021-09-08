//
//  MenuViewController.swift
//  Tbilisi Murals Fest
//
//  Created by Giga Khizanishvili on 5/26/20.
//  Copyright © 2020 Giga Khizanishvili. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    // MARK: - Outlets
	@IBOutlet weak var sponsorsImage: UIImageView!
    
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var artistsButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var contactsButton: UIButton!
    
    // MARK: - Properties
    public static let identifier = "MenuViewController"
    
    private lazy var menuButtons: [UIButton] = [
        mapButton,
        artistsButton,
        galleryButton,
        contactsButton
    ]
    
    private var sponsorsImages = SponsorsManager.getSponsorImageNames().map{ UIImage(named: $0) }
	private var sponsorIndex = 0
    
    // MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
        setup()
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupMenuButtons()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupSponsors()
    }
    
    private func setupMenuButtons() {
        for button in menuButtons {
            button.rounded(with: 8)
            button.layer.masksToBounds = true
        }
    }
    
    private func setupSponsors() {
        sponsorsImage.image = sponsorsImages[sponsorIndex]
        Timer.scheduledTimer(
            timeInterval: Constants.numSecondsForEachSponsor,
            target: self,
            selector: #selector(self.changeSponsor),
            userInfo: nil,
            repeats: true
        )
    }

	@objc func changeSponsor() {
		sponsorsImage.image = sponsorsImages[sponsorIndex]
		sponsorIndex = (sponsorIndex + 1) % sponsorsImages.count
	}
    
}
