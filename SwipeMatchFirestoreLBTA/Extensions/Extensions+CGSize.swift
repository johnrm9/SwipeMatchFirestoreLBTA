//
//  Extensions+CGSize.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/8/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension CGSize {
    public init(all: CGFloat = 0) {
        self.init()
        if all != 0 { (width, height) = (all, all) }
    }
    public init(width: CGFloat) {
        self.init()
        (self.width, height) = (width, 0)
    }
    public init(height: CGFloat) {
        self.init()
        (width, self.height) = (0, height)
    }
}

