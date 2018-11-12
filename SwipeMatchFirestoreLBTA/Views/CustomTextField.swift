//
//  CustomTextField.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/11/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    private let padding: CGFloat
    private let height: CGFloat

    init(padding: CGFloat, height: CGFloat) {
        (self.padding, self.height) = (padding, height)
        super.init(frame: .zero)
        layer.cornerRadius = height / 2
        backgroundColor = .white
        autocapitalizationType = .none
        autocorrectionType = .no
    }

    override var intrinsicContentSize: CGSize {
        return .init(height: height)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
