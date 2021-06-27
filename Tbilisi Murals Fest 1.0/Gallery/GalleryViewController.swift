//
//  GalleryViewController.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import UIKit

class GalleryViewController: UIViewController {
    
    public static let identifier = "GalleryViewController"

	@IBOutlet weak var tableView: UITableView!

	private let muralsDB = MuralsDatabase.sharedInstance

	override func viewDidLoad() {
		super.viewDidLoad()
        setupTableView()
	}
    
    // MARK: Setup
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: GalleryTableViewCell.reuseId, bundle: nil), forCellReuseIdentifier: GalleryTableViewCell.reuseId)
    }

}

extension GalleryViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GalleryViewController.Constants.cellHeight
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return muralsDB.getMuralsCount()
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: GalleryTableViewCell.reuseId, for: indexPath) as? GalleryTableViewCell {
			let mural = muralsDB.getMural(ID: indexPath.row)
			cell.muralMainImage.image = UIImage(named: mural.imageURLs[0])
			return cell
		}
        
        return UITableViewCell()
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if let muralVC = storyBoard.instantiateViewController(withIdentifier: MuralViewController.identifier) as? MuralViewController {
			muralVC.mural = muralsDB.getMural(ID: indexPath.row)
			self.navigationController?.pushViewController(muralVC, animated: true)
		}
	}

}
