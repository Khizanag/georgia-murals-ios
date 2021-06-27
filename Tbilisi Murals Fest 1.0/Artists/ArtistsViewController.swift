//
//  ArtistsViewController.swift
//  Tbilisi Murals Fest
//
//  Created by Giga Khizanishvili on 5/25/21.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class ArtistsViewController: UIViewController {
    
    public static let identifier = "ArtistsViewController"

	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()

		setup()
	}
    
    // MARK: Setup
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ArtistsTableViewCell.reuseId, bundle: nil), forCellReuseIdentifier: ArtistsTableViewCell.reuseId)
    }

}

extension ArtistsViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Sizes.cellHeight
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ArtistsDatabase.sharedInstance.getArtistsCount()
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArtistsTableViewCell.reuseId, for: indexPath) as? ArtistsTableViewCell {
            let artist = ArtistsDatabase.sharedInstance.getArtist(ID: indexPath.row)!
            let name = artist.name
            cell.name.text = name
            cell.profilePhoto.image = UIImage(named: artist.profileImageURL)
        }
		
		return UITableViewCell()
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: ArtistPageViewController.identifier) as? ArtistPageViewController {
			let artist = ArtistsDatabase.sharedInstance.getArtist(ID: indexPath.row)!
			vc.artist = artist
			navigationController?.pushViewController(vc, animated: true)
		}
	}

}
