//
//  PanZoomImageView.swift
//  Tbilisi Murals Fest 1.0
//
//  Created by Giga Khizanishvili on 10.09.21.
//

import UIKit

class PanZoomImageView: UIScrollView {

    @IBInspectable
    private var imageName: String? {
        didSet {
            guard let imageName = imageName else { return }
            imageView.image = UIImage(named: imageName)
        }
    }
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    convenience init(named: String) {
        self.init(frame: .zero)
        imageName = named
        imageView.image = UIImage(named: named)
    }

    private func commonInit() {
        setupImageView()
        setupScrollView()
//        setupDoubleTapRecognizer()
        setupDismissRecognizer()
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        bringSubviewToFront(imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupScrollView() {
        minimumZoomScale = 1
        maximumZoomScale = 5
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
    }
    
    private func setupDoubleTapRecognizer() {
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTapRecognizer)
    }
    
    @objc private func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        if zoomScale == 1 {
            setZoomScale(2, animated: true)
        } else {
            setZoomScale(1, animated: true)
        }
    }
    
    private func setupDismissRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }

}

extension PanZoomImageView: UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? { imageView }

}
