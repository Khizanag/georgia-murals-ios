//
//  MuralView.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import UIKit

protocol MuralDelegate: Any {

}

class MuralView: BaseReusableView {

	@IBOutlet var stackOfMetaInfo: UIStackView!

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var titleLabel: UILabel!

	@IBOutlet var projectLabel: UILabel!
	@IBOutlet var projectLabelTitle: UILabel!

	@IBOutlet var artistLabel: UILabel!
	@IBOutlet var artistLabelTitle: UILabel!

	@IBOutlet var descriptionLabel: UILabel!
	@IBOutlet var descriptionLabelTitle: UILabel!

	@IBOutlet var yearLabel: UILabel!
	@IBOutlet var yearLabelTitle: UILabel!

	@IBOutlet var locationLabel: UILabel?		// TODO
	@IBOutlet var locationLabelTitle: UILabel!	// TODO

	@IBOutlet var locationTitleLabel: UILabel!
	@IBOutlet var locationTitleLabelTitle: UILabel!

	private var imageIndex: Int = 0

	var mural: Mural = MuralsDatabase.sharedInstance.defaultMural

	lazy var flowLayout: UICollectionViewFlowLayout = {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.scrollDirection = .horizontal
		return flowLayout
	}()

	public func setup(showMetaInfo: Bool) {
		if mural.ID == MuralsDatabase.sharedInstance.defaultMural.ID { return }

		if showMetaInfo {
			setup()
		} else {
//			imageView.image = UIImage(named: mural.imageURLs[0])
			titleLabel.isHidden = true
			stackOfMetaInfo.isHidden = true
		}
	}

	override func setup() {

		configureCollectionView()

//		imageView.isUserInteractionEnabled = true // TODO

		if mural.ID == MuralsDatabase.sharedInstance.defaultMural.ID { return }
//		imageView.image = UIImage(named: mural.imageURLs[0]) // TODO

		if mural.title != nil {
			titleLabel.text! = mural.title!
		} else {
//			titleLabel.text! = "Title of mural"
			titleLabel.isHidden = true
		}

		if mural.project != nil {
			projectLabel.text! = mural.project!
		} else {
			projectLabel.isHidden = true
			projectLabelTitle.isHidden = true
		}

		artistLabel.text! = mural.artist

		if mural.description != nil {
			descriptionLabel.text! = mural.description!
		} else {
//			descriptionLabel.text! = "Default description"
			descriptionLabel.isHidden = true
			descriptionLabelTitle.isHidden = true
		}

		if mural.year != nil {
			yearLabel.text! = (String)(mural.year!)
		} else {
//			yearLabel.text! = "2020"
			yearLabel.isHidden = true
			yearLabelTitle.isHidden = true
		}

//		locationLabel.text! = (String)(mural.location.0) + ", " + (String)(mural.location.1)

		if mural.locationTitle != nil {
			locationTitleLabel.text! = mural.locationTitle!
		} else {
//			locationTitleLabel.text! = "Default location description"
			locationTitleLabel.isHidden = true
			locationTitleLabelTitle.isHidden = true
		}
	}

	func configureCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.collectionViewLayout = flowLayout

		collectionView.register(
			UINib(nibName: "MuralImageCollectionViewCell", bundle: nil), // TODO change on .self
			forCellWithReuseIdentifier: "MuralImageCollectionViewCell"
		)
	}

}


extension MuralView: UICollectionViewDelegate {}

extension MuralView: UICollectionViewDataSource {

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return mural.imageURLs.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MuralImageCollectionViewCell.reuseId, for: indexPath)
		if let muralCollectionViewCell = cell as? MuralImageCollectionViewCell {
			muralCollectionViewCell.imageView.image = UIImage(named: mural.imageURLs[indexPath.row])
			return muralCollectionViewCell
		}
		return cell
	}

}

extension MuralView: UICollectionViewDelegateFlowLayout {

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

extension MuralView {

	struct Constants {
		static let itemCountInLine: CGFloat = 2
		static let spacing: CGFloat = 20
	}
}
