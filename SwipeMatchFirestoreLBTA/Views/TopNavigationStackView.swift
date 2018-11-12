//
//  TopNavigationStackView.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/1/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

enum TopButtons: Int, CaseIterable {
    case settings = 1001
    case message =  1002

    static func foundTag(rawValue: Int) -> Bool {
        guard let `case` = TopButtons(rawValue: rawValue) else { return false }
        return allCases.contains(`case`)
    }
}

class TopNavigationStackView: BaseStackView {

    private let settingsButton: UIButton = .systemButton(image: #imageLiteral(resourceName: "top_left_profile"), tag: TopButtons.settings.rawValue)
    private let messageButton: UIButton  = .systemButton(image: #imageLiteral(resourceName: "top_right_messages"), tag: TopButtons.message.rawValue)

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
