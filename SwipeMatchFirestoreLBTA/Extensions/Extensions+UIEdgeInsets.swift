//
//  Extensions+UIEdgeInsets.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/1/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    public init(all: CGFloat = 0) {
        self.init()
        if all != 0 { (top, bottom, left, right) = (all, all, all, all) }
    }
    public init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
        self.init()
        if vertical != 0 { (top, bottom) = (vertical, vertical) }
        if horizontal != 0 { (left, right) = (horizontal, horizontal) }
    }
    public init(bottom: CGFloat) {
        self.init()
        (top, self.bottom, left, right) = (0, bottom, 0, 0)
    }
    public init(bottomLeftRightAll: CGFloat) {
        self.init()
        (top, self.bottom, self.left, self.right) = (0, bottomLeftRightAll, bottomLeftRightAll, bottomLeftRightAll)
    }
    public init(topLeftRightAll: CGFloat) {
        self.init()
        (self.top, bottom, self.left, self.right) = (topLeftRightAll, 0, topLeftRightAll, topLeftRightAll)
    }
}

