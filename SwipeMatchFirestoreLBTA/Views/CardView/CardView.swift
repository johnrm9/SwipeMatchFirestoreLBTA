//
//  CardView.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/2/18.
//  Copyright © 2018 John Martin. All rights reserved.
//
import GestureRecognizerClosures
import UIKit

class CardView: BaseView {
    fileprivate static let threshold: CGFloat = 80
    fileprivate static let rotationFactor: CGFloat = 0.05

    var cardViewModel: CardViewModel! {
        didSet {
            guard let firstImageName = cardViewModel.firstImageName else { return }

            imageView.image = UIImage(named: firstImageName)
            informationLabel.attributedText = cardViewModel.attributedString
            informationLabel.textAlignment = cardViewModel.textAlignment

            barsStackView.setup(with: cardViewModel.count)

            cardViewModel.imageIndexObserver = imageIndexObserver
        }
    }

    private let barsStackView = BarsStackview()

    private let imageView: UIImageView = make { (imageView) in
        imageView.backgroundColor = .blue
    }

    private let gradientLayer = CAGradientLayer(colors: [UIColor.clear, .black], locations: [0.5, 1.1])

    private let informationLabel: UILabel = make { (label) in
        label.textColor = .white
        label.numberOfLines = 0
    }

    override func setupView() {
        super.setupView()
        layer.cornerRadius = 10

        addSubviews(imageView, barsStackView, gradientLayer, informationLabel)

        imageView.fillSuperview()

        barsStackView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor,
                             padding: .init(topLeftRightAll: 8))

        informationLabel.anchor(leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,
                                padding: .init(bottomLeftRightAll: 16))

        onTap { (recognizer) in self.handleTap(recognizer) }

        onPan { (recognizer) in
            switch recognizer.state {
            case .began:
                self.removeAllAnimations()
            case .changed:
                self.handleChanged(recognizer)
            case .ended:
                self.handleEnded(recognizer)
            case .possible, .cancelled, .failed: ()
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.frame
    }

    // MARK: - Image Index Observer
    private lazy var imageIndexObserver: ImageIndexCompletion = { [weak self] (index: Int, image: UIImage?) in
        guard let image = image else { return }
        self?.imageView.image = image
        self?.barsStackView.resetBarViewsWithSelected(at: index)
    }

    // MARK: - Fileprivate
    fileprivate func handleTap(_ recognizer: UITapGestureRecognizer) {
        let shouldAdvanceNextPhoto: Bool = recognizer.locationX > frame.midX

        if shouldAdvanceNextPhoto {
            cardViewModel.advanceToNextPhoto()
        } else {
            cardViewModel.goToPreviousPhoto()
        }
    }

    fileprivate func handleChanged(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationPoint

        let degrees = translation.x * CardView.rotationFactor
        let rotationAngle = degrees.toRadians

        transform = CGAffineTransform(rotationAngle: rotationAngle).translatedBy(x: translation.x, y: translation.y)
    }

    fileprivate func handleEnded(_ recognizer: UIPanGestureRecognizer) {
        let translationX = recognizer.translationX
        let translationDirection = translationX.signValue

        let shouldDismissCard = abs(translationX) > CardView.threshold

        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                self.frame = self.frame.offsetBy(dx: .infinity * translationDirection, dy: 0)
            } else {
                self.transform = .identity
            }
        }) {_ in self.transform = .identity; if shouldDismissCard { self.removeFromSuperview() } }
    }
}

