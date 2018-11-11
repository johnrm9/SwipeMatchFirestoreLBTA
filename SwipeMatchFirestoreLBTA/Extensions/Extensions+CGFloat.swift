//
//  Extensions+CGFloat.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/3/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension CGFloat {
    var toRadians: CGFloat { return self * .pi / 180 }
    var signValue: CGFloat { return self > -self ? +1 : -1 }
}
