//
//  Extensions+UIGestureRecognizer.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/7/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension UIPanGestureRecognizer {
    var translationPoint: CGPoint {
        return translation(in: nil)
    }
    var translationX: CGFloat {
        return translationPoint.x
    }
    var translationY: CGFloat {
        return translationPoint.y
    }
}

extension UIGestureRecognizer {
    var locationPoint: CGPoint {
        return location(in: nil)
    }
    var locationX: CGFloat {
        return locationPoint.x
    }
    var locationY: CGFloat {
        return locationPoint.y
    }
}
