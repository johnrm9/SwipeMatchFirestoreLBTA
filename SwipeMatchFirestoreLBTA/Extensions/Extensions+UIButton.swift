//
//  Extensions+UIButton.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/5/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIButton {
    static public func systemButton(title: String? = nil, image: UIImage? = nil, titleColor: UIColor? = .white, font: UIFont? = nil, target: Any? = nil, selector: Selector? = nil) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        if let selector = selector {
            button.addTarget(target, action: selector, for: .touchUpInside)
        }
        return button
    }
}
