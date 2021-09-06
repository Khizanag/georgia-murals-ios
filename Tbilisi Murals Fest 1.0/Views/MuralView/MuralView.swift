//
//  MuralView.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 02.12.20.
//

import UIKit
import ScalingCarousel

class MuralView: BaseReusableView {
    
    // MARK: - Outlets

	@IBOutlet weak var stackOfMetaInfo: UIStackView!

	@IBOutlet weak var collectionView: ScalingCarouselView!
	@IBOutlet weak var titleLabel: UILabel!

	@IBOutlet weak var projectLabel: UILabel!
	@IBOutlet weak var projectLabelTitle: UILabel!

	@IBOutlet weak var artistLabel: UILabel!
	@IBOutlet weak var artistLabelTitle: UILabel!

	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var descriptionLabelTitle: UILabel!

	@IBOutlet weak var yearLabel: UILabel!
	@IBOutlet weak var yearLabelTitle: UILabel!

	@IBOutlet weak var locationLabel: UILabel!		// TODO
	@IBOutlet weak var locationLabelTitle: UILabel!	// TODO

	@IBOutlet weak var locationTitleLabel: UILabel!
	@IBOutlet weak var locationTitleLabelTitle: UILabel!

    // MARK: - Properties
	private var imageIndex: Int = 0
	var mural: Mural = MuralsDatabase.sharedInstance.defaultMural

    // MARK: - Setup
    
	public func setup(showMetaInfo: Bool) {
		guard mural.ID != MuralsDatabase.sharedInstance.defaultMural.ID else { return }

		if showMetaInfo {
			setup()
		} else {
			titleLabel.hide()
			stackOfMetaInfo.hide()
		}
	}

	override func setup() {
        super.setup()
        guard mural.ID != MuralsDatabase.sharedInstance.defaultMural.ID else { return }
        setupCollectionView()
		setupTitle()
		setupProject()
		setupArtist()
		setupDescription()
        setupYear()
		setupLocation()
	}
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            return layout
        }()

        collectionView.register(
            UINib(nibName: MuralImageCollectionViewCell.reuseId, bundle: nil),
            forCellWithReuseIdentifier: MuralImageCollectionViewCell.reuseId)
    }
    
    private func setupTitle() {
        if let title = mural.title {
            titleLabel.text = title
        } else {
            titleLabel.hide()
        }
    }
    
    private func setupProject() {
        if let project = mural.project {
            projectLabel.text = project
        } else {
            projectLabel.hide()
            projectLabelTitle.hide()
        }
    }
    
    private func setupArtist() {
        artistLabel.text = mural.artist
    }
    
    private func setupDescription() {
        if let description = mural.description {
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
            descriptionLabelTitle.isHidden = true
        }
    }
    
    private func setupYear() {
        if let year = mural.year {
            yearLabel.text = year.description
        } else {
            yearLabel.isHidden = true
            yearLabelTitle.isHidden = true
        }
    }
    
    private func setupLocation() {
        if let locationTitle = mural.locationTitle {
            locationTitleLabel.text = locationTitle
        } else {
            locationTitleLabel.hide()
            locationTitleLabelTitle.hide()
        }
    }

}


extension MuralView: UICollectionViewDataSource {

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return mural.imageURLs.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MuralImageCollectionViewCell.reuseId, for: indexPath)
        if let cell = cell as? MuralImageCollectionViewCell {
            cell.imageView.image = UIImage(named: mural.imageURLs[indexPath.row])
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
			return cell
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
