//
//  BaseView.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/2/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
