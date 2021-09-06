//
//  BioViewController.swift
//  Tbilisi Murals Fest
//
//  Created by macbook on 5/25/20.
//  Copyright © 2020 macbook. All rights reserved.
//


import UIKit
import SafariServices
import CoreLocation

class ArtistPageViewController: UIViewController {

    public static let identifier = "ArtistPageViewController"

    @IBOutlet weak var bioText: UITextView!
    @IBOutlet weak var circulaImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!

    @IBOutlet var tableView: UITableView!
    private let muralsDB = MuralsDatabase.sharedInstance
    public var artist: Artist = ArtistsDatabase.defaultArtist

    @IBAction func openInstagram(_ sender: Any) {
        if let igUsername = artist.socialProfiles[.instagram] {
            let igUrl = SocialMediaManager.buildInstagramUrl(username: igUsername)
            let vc = SFSafariViewController(url: URL(string: igUrl)!)
            present(vc, animated: true)
        }
    }

    @IBAction func openFacebook(_ sender: Any) {
        if let fbUsername = artist.socialProfiles[.facebook] {
            let fbUrl = SocialMediaManager.buildFacebookUrl(username: fbUsername)
            let vc = SFSafariViewController(url: URL(string: fbUrl)!)
            present(vc, animated: true)
        }
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        setup()
        filterSocialMediaButtons()
	}
    
    private func setup() {
        setupScrollView()
        setupDisplayInfo()
        setupTableView()
        setupNavigationItem()
    }
    
    private func setupNavigationItem() {
        navigationItem.title = artist.name
    }

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		initCircularImage()
	}

	private func initCircularImage() {
		circulaImage.layer.cornerRadius = circulaImage.frame.size.width/2
		circulaImage.clipsToBounds = true
	}

	private func setupDisplayInfo() {
		artistNameLabel.text = artist.name
		circulaImage.image = UIImage(named: artist.profileImageURL)
		bioText.text = artist.bio
	}

	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
        tableView.register(
            UINib(nibName: GalleryTableViewCell.reuseId, bundle: nil),
            forCellReuseIdentifier: GalleryTableViewCell.reuseId)
	}

	private func setupScrollView() {
		scrollView.delegate = self
	}

	private func filterSocialMediaButtons() {
        if artist.socialProfiles[.facebook] == nil {
			facebookButton.hide()
		}
        if artist.socialProfiles[.instagram] == nil {
			instagramButton.hide()
		}
	}
}


extension ArtistPageViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return artist.murals.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: GalleryTableViewCell.reuseId, for: indexPath) as? GalleryTableViewCell {
			let mural = artist.murals[indexPath.row]
			cell.muralMainImage.image = UIImage(named: mural.imageURLs[0])
			return cell
		}
        
        return UITableViewCell()
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if let muralVC = storyBoard.instantiateViewController(withIdentifier: MuralViewController.identifier) as? MuralViewController {
			muralVC.mural = artist.murals[indexPath.row]
			navigationController?.pushViewController(muralVC, animated: true)
		}
	}
}
