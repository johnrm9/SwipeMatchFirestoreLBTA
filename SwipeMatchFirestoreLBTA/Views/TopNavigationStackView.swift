//
//  TopNavigationStackView.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/1/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class TopNavigationStackView: BaseStackView {

    private let settingsButton: UIButton = .systemButton(image: #imageLiteral(resourceName: "top_left_profile"))
    private let messageButton: UIButton = .systemButton(image: #imageLiteral(resourceName: "top_right_messages"))

    private let fireImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "app_icon"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func setupViews() {
        super.setupViews()
        heightAnchor.constraint(equalToConstant: 80).isActive = true

        distribution = .equalCentering
        layoutMargins = .init(horizontal: 16)

        addArrangedSubviews([settingsButton, UIView(), fireImageView, UIView(), messageButton])
    }
}
