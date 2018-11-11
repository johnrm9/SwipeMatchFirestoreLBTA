//
//  Extensions+NSMutableAttributedString.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/5/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {

    public func appendNewLine() {
        append(NSAttributedString(string: "\n"))
    }

    public func appendSpaces(_ count: Int = 1) {
        append(NSAttributedString(string: count.spaces))
    }

    public func centerAlignWithSpacing(_ lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = lineSpacing
        setParagraphStyle(paragraphStyle: paragraphStyle)
    }

    public func setLineSpacing(_ lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        setParagraphStyle(paragraphStyle: paragraphStyle)
    }

    func setParagraphStyle(paragraphStyle: NSParagraphStyle) {
        let range = NSMakeRange(0, string.count)
        addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
    }
}
