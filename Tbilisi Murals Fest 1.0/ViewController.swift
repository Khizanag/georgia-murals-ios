//
//  ViewController.swift
//  My Tbilisi Murals Fest
//
//  Created by Giga Khizanishvili on 9/29/20.
//

import UIKit

class ViewController: UIViewController {
    
    public static let identifier = "ViewController"

	@IBOutlet weak var gifView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		gifView.loadGif(name: "IntroGifResoluted")

		self.navigationController?.navigationBar.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + SponsorsManager.Constants.eachSponsorShowTime) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            if let vc = storyBoard.instantiateViewController(withIdentifier: MenuViewController.identifier) as? MuralViewController {
                self.navigationController?.pushViewController(vc, animated: true)
            }
		}
	}

}

