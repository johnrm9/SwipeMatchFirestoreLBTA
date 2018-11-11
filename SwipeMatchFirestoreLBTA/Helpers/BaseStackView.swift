//
//  BaseStackView.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/1/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class BaseStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews() {
        isLayoutMarginsRelativeArrangement = true
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
