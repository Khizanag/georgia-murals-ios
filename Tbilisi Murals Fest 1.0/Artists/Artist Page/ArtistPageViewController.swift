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

    // MARK: - Outlets
    @IBOutlet weak var bioText: UITextView!
    @IBOutlet weak var profilePhotoView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!

    @IBOutlet var muralsCollectionView: UICollectionView!
    
    // MARK: - Properties
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
    
    // MARK: - Setup
    private func setup() {
        setupScrollView()
        setupDisplayInfo()
        setupCollectionView()
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
		profilePhotoView.layer.cornerRadius = profilePhotoView.frame.size.width/2
        profilePhotoView.clipsToBounds = true
	}

	private func setupDisplayInfo() {
		artistNameLabel.text = artist.name
		profilePhotoView.image = UIImage(named: artist.profileImageURL)
		bioText.text = artist.bio
	}

	private func setupCollectionView() {
        muralsCollectionView.delegate = self
        muralsCollectionView.dataSource = self
        muralsCollectionView.collectionViewLayout = {
            let layout = UICollectionViewFlowLayout()
            // TODO: setup layout
            return layout
        }()
        
        muralsCollectionView.register(
            UINib(nibName: MuralPreviewCollectionViewCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: MuralPreviewCollectionViewCell.reuseIdentifier)
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

// MARK: - UICollectionViewDataSource

extension ArtistPageViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        artist.murals.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MuralPreviewCollectionViewCell.reuseIdentifier, for: indexPath)
        if let cell = cell as? MuralPreviewCollectionViewCell {
            if let firstImage = UIImage(named: artist.murals[indexPath.row].imageURLs[0]) {
                cell.configure(with: .init(image: firstImage))
                return cell
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if let muralVC = storyBoard.instantiateViewController(withIdentifier: MuralViewController.identifier) as? MuralViewController {
            muralVC.mural = artist.murals[indexPath.row]
            navigationController?.pushViewController(muralVC, animated: true)
        }
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension ArtistPageViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width:  collectionView.frame.width,
            height: collectionView.frame.height
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constants.spacing
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constants.spacing
    }
}
