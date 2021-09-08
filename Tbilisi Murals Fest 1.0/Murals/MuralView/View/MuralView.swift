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
    @IBOutlet weak var collectionViewPageControl: UIPageControl!
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.deviceRotated()
    }

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
        collectionView.inset = collectionView.frame.width / 12
        setupCollectionViewRegistrations()
        setupCollectionViewPageControl()
    }
    
    private func setupCollectionViewPageControl() {
        collectionViewPageControl.numberOfPages = mural.imageURLs.count
    }
    
    private func setupCollectionViewRegistrations() {
        collectionView.register(
            UINib(nibName: MuralPreviewCollectionViewCell.reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: MuralPreviewCollectionViewCell.reuseIdentifier)
    }
    
    @IBAction func muralPageContolValueChanged(_ sender: Any) {
        let indexPath = IndexPath(row: collectionViewPageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        collectionView.didScroll()
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

// MARK: - UICollectionViewDelegate

extension MuralView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.didScroll()
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let centerCellIndex = collectionView.currentCenterCellIndex else { return }
        collectionViewPageControl.currentPage = centerCellIndex.row
    }
}

// MARK: - UICollectionViewDataSource

extension MuralView: UICollectionViewDataSource {

	func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mural.imageURLs.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MuralPreviewCollectionViewCell.reuseIdentifier, for: indexPath)
        if let cell = cell as? MuralPreviewCollectionViewCell {
            cell.configure(with: .init(image: UIImage(named: mural.imageURLs[indexPath.row])!))
			return cell
		}
		return cell
	}
    
}
