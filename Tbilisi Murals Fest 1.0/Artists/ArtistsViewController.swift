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

    // MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
    
    // MARK: - Setup
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: ArtistsTableViewCell.reuseIdentifier, bundle: nil),
            forCellReuseIdentifier: ArtistsTableViewCell.reuseIdentifier)
    }

}

// MARK: - UITableView
extension ArtistsViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.Size.cellHeight
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		ArtistsDatabase.shared.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArtistsTableViewCell.reuseIdentifier, for: indexPath) as? ArtistsTableViewCell {
            if let artist = ArtistsDatabase.shared.getArtist(ID: indexPath.row) {
				print("***** \(artist.name)")
                cell.configure(with: .init(profilePhoto: UIImage(named: artist.profileImageName)!, name: artist.name))
                return cell
            }
        }
		
		return UITableViewCell()
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: ArtistPageViewController.identifier) as? ArtistPageViewController {
            guard let artist = ArtistsDatabase.shared.getArtist(ID: indexPath.row) else { return }
			vc.artist = artist
			navigationController?.pushViewController(vc, animated: true)
		}
	}

}
