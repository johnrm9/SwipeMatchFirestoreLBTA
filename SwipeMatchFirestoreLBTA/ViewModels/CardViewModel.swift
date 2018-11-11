//
//  CardViewModel.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/5/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

typealias ImageIndexCompletion = ((_ index: Int, _ image: UIImage?) -> Void)

protocol ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel
}

protocol ImageIndexObserver {
    var imageIndexObserver: ImageIndexCompletion? {get set}
}

class CardViewModel: ImageIndexObserver {
    var imageIndexObserver: ImageIndexCompletion?

    let imageNames: [String]
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment

    init(imageNames names: [String], attributedString string: NSAttributedString, textAlignment alignment: NSTextAlignment = .left) {
        (imageNames, attributedString, textAlignment) = (names, string, alignment)
    }

    subscript(index: Int) -> String? {
        return imageNames[safe: index]
    }

    var count: Int {
        return imageNames.count
    }

    var firstImageName: String? {
        return imageNames.first
    }

    private var firstImageIndex: Int? {
        return imageNames.indices.first
    }

    private var lastImageIndex: Int? {
        return imageNames.indices.last
    }

    private var imageIndex: Int = 0 {
        didSet {
            guard let imageName = self[imageIndex] else { return }
            let image = UIImage(named: imageName)
            imageIndexObserver?(imageIndex, image)
        }
    }

    func advanceToNextPhoto() {
        guard let lastImageIndex = lastImageIndex else { return }
        imageIndex = min(imageIndex + 1, lastImageIndex)
    }

    func goToPreviousPhoto() {
        guard let firstImageIndex = firstImageIndex else { return }
        imageIndex = max(firstImageIndex, imageIndex - 1)
    }
}
