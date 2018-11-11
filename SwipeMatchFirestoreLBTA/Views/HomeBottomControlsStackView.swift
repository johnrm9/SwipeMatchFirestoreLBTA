//
//  HomeBottomControlsStackView.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/1/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class HomeBottomControlsStackView: BaseStackView {

    override func setupViews() {
        super.setupViews()
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 100).isActive = true

        let subviews = [#imageLiteral(resourceName: "refresh_circle"), #imageLiteral(resourceName: "dismiss_circle"), #imageLiteral(resourceName: "super_like_circle"), #imageLiteral(resourceName: "like_circle"), #imageLiteral(resourceName: "boost_circle")].map { (image) -> UIButton in return .systemButton(image: image) }
        addArrangedSubviews(subviews)
    }
}
