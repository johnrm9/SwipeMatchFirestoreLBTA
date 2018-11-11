//
//  BarsStackview.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/9/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class BarsStackview: BaseStackView {
    private let barDeselectedColor = UIColor(white: 0, alpha: 0.1)
    private let barSelectedColor: UIColor = .white

    override func setupViews() {
        super.setupViews()
        distribution = .fillEqually
        spacing = 4
    }

    override var intrinsicContentSize: CGSize { return .init(height: 4) }

    public func resetBarViewsWithSelected(at index: Int = 0) {
        let selectedColor: UIColor = subviews.count > 1 ? barSelectedColor : .clear
        subviews.forEach { $0.backgroundColor = barDeselectedColor }
        subviews[safe: index]?.backgroundColor = selectedColor
    }

    public func setup(with count: Int) {
        addArrangedSubviews(count: count)
        resetBarViewsWithSelected()
    }
}
