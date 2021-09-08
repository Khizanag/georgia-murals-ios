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
	@IBOutlet weak var collectionView: ScalingCarouselView!

    @IBOutlet weak var titleStack: UIStackView!
    @IBOutlet weak var titleKeyLabel: UILabel!
    @IBOutlet weak var titleValueLabel: UILabel!
    
    @IBOutlet weak var projectStack: UIStackView!
    @IBOutlet weak var projectKeyLabel: UILabel!
	@IBOutlet weak var projectValueLabel: UILabel!

    @IBOutlet weak var artistStack: UIStackView!
    @IBOutlet weak var artistKeyLabel: UILabel!
	@IBOutlet weak var artistValueLabel: UILabel!
    
    @IBOutlet weak var yearStack: UIStackView!
	@IBOutlet weak var yearKeyLabel: UILabel!
	@IBOutlet weak var yearValueLabel: UILabel!
    
    @IBOutlet weak var locationDescriptionStack: UIStackView!
	@IBOutlet weak var locationDescriptionKeyLabel: UILabel!
	@IBOutlet weak var locationDescriptionValueLabel: UILabel!
    
    @IBOutlet weak var descriptionStack: UIStackView!
    @IBOutlet weak var descriptionKeyLabel: UILabel!
    @IBOutlet weak var descriptionValueLabel: UILabel!


    // MARK: - Properties
	private var imageIndex: Int = 0
	private var mural: Mural = MuralsDatabase.sharedInstance.defaultMural

    // MARK: - Setup

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
            UINib(nibName: MuralImageCollectionViewCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: MuralImageCollectionViewCell.reuseIdentifier)
    }
    
    private func setupTitle() {
        if let title = mural.title {
            titleValueLabel.text = title
        } else {
            titleStack.hide()
        }
    }
    
    private func setupProject() {
        if let project = mural.project {
            projectKeyLabel.text = project
        } else {
            projectStack.hide()
        }
    }
    
    private func setupArtist() { // TODO: convert artist to nilable
        artistKeyLabel.text = mural.artist
    }
    
    private func setupDescription() {
        if let description = mural.description {
            descriptionKeyLabel.text = description
        } else {
            descriptionStack.hide()
        }
    }
    
    private func setupYear() {
        if let year = mural.year {
            yearKeyLabel.text = year.description
        } else {
            yearStack.hide()
        }
    }
    
    private func setupLocation() {
        if let locationTitle = mural.locationTitle {
            locationDescriptionKeyLabel.text = locationTitle
        } else {
            locationDescriptionStack.hide()
        }
    }
    
    public func configure(with model: Mural) {
        mural = model
        setup()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MuralImageCollectionViewCell.reuseIdentifier, for: indexPath)
        if let cell = cell as? MuralImageCollectionViewCell {
            cell.configure(with: .init(image: UIImage(named: mural.imageURLs[indexPath.row])!))
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
