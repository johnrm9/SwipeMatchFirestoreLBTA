//
//  Extensions+CAGradientLayer.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/8/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    convenience init(colors: [UIColor], locations: [NSNumber]? = nil) {
        self.init()
        self.colors = colors.map { $0.cgColor }
        self.locations = locations
    }
}
