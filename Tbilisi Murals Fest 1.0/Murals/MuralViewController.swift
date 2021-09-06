//
//  MuralViewController.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import UIKit
import SafariServices
import CoreLocation

class MuralViewController: UIViewController, CLLocationManagerDelegate {
    
    public static let identifier = "MuralViewController"

    // MARK: - Outlets
	@IBOutlet var muralView: MuralView!
	@IBOutlet var getDirectionsButton: UIButton!
	@IBOutlet var goToArtistPageButton: UIButton!

    // MARK: - Properties
	private let muralsDB = MuralsDatabase.sharedInstance
	private let artistsDB = ArtistsDatabase.sharedInstance
	private let locationManager = CLLocationManager()
	public var mural: Mural = MuralsDatabase.sharedInstance.defaultMural

	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
    
    private func setup() {
        setupLocationManager()
        setupMuralView()
        setupNavigationItem()
    }

	private func setupLocationManager() {
		locationManager.requestAlwaysAuthorization()

		if CLLocationManager.locationServicesEnabled() {
			locationManager.delegate = self
			locationManager.desiredAccuracy = kCLLocationAccuracyBest
			locationManager.distanceFilter = 35

			locationManager.startUpdatingLocation()
		}
	}
    
    private func setupMuralView() {
        muralView.configure(with: mural)
    }
    
    private func setupNavigationItem() {
        if let title = mural.title {
            navigationItem.title = title
        }
    }

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		initGetDirectionsButton()
		initGoToArtistPageButton()
	}

	private func initGetDirectionsButton() {
		getDirectionsButton.layer.cornerRadius = getDirectionsButton.bounds.size.width / 40
	}

	private func initGoToArtistPageButton() {
		goToArtistPageButton.layer.cornerRadius = goToArtistPageButton.bounds.size.width / 40
	}

	@IBAction private func getDirectionsHandler(_ sender: Any) {
		let location = mural.location
		let vc = SFSafariViewController(url: URL(string: "http://maps.google.com/maps?&daddr=\(location.0),\(location.1)")!)
		present(vc, animated: true)
	}

	@IBAction func goToArtistsPageHandler(_ sender: Any) {
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if let bioVC = storyBoard.instantiateViewController(withIdentifier: ArtistPageViewController.identifier) as? ArtistPageViewController {
			bioVC.artist = ArtistsDatabase.sharedInstance.getArtist(name: mural.artist)!
			navigationController?.pushViewController(bioVC, animated: true)
		}
	}

}
