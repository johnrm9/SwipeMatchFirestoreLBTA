//
//  Extensions+UIButton.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/5/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIButton {
    static public func systemButton(title: String? = nil, image: UIImage? = nil, titleColor: UIColor? = .white, backgroundColor: UIColor? = nil,
                                    font: UIFont? = nil, cornerRadius: CGFloat = 0,
                                    target: Any? = nil, selector: Selector? = nil, tag: Int = 0) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = font
        button.layer.cornerRadius = cornerRadius
        button.tag = tag
        if let selector = selector {
            button.addTarget(target, action: selector, for: .touchUpInside)
        }
        return button
    }
}
