//
//  Extensions+UIStackView.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/1/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]? = nil, count: Int = 0) {
        let views = views ?? [UIView](count: count, elementCreator: UIView())
        views.forEach { addArrangedSubview($0) }
    }
}

extension UIStackView {
    convenience init(arrangedSubviews: [UIView]? = nil,
                     axis: NSLayoutConstraint.Axis = .horizontal,
                     distribution: UIStackView.Distribution = .fill,
                     spacing: CGFloat = UIStackView.spacingUseDefault, margins: UIEdgeInsets = .zero) {
        if let arrangedSubviews = arrangedSubviews {
            self.init(arrangedSubviews: arrangedSubviews)
        } else {
            self.init()
        }

        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        setMargins(margins)
    }
}

extension UIStackView {
    func setMargins(_ margins: UIEdgeInsets) {
        guard margins != .zero else { return }
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = margins
    }
}

