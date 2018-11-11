//
//  Extensions+UIView.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/1/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIView {
    func removeAllAnimations() {
        superview?.subviews.forEach { $0.layer.removeAllAnimations() }
    }
}

extension UIView {
    func addSubviews(_ views: Any...) {
        views.forEach {
            if $0 is UIView {
                let view = $0 as! UIView
                addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            } else if $0 is CALayer {
                layer.addSublayer($0 as! CALayer)
            }
        }
    }
}

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {

        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }

        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }

        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }

        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }

        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }

        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }

        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach { $0?.isActive = true }

        return anchoredConstraints
    }
}

extension UIView {
    func fillSuperSafeAreaView(padding: UIEdgeInsets = .zero) {
        fillSuperview(padding: padding, isSafeArea: true)
    }

    func fillSuperview(padding: UIEdgeInsets = .zero, isSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let superviewTopAnchor = isSafeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }

        if let superview = superview {
            let superviewBottomAnchor = isSafeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }

        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }

        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }

    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }

        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }

        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }

        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
