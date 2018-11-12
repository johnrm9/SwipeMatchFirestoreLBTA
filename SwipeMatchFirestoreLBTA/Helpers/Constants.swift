//
//  Constants.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/11/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

struct RegistrationGradientLayer {
    static let topColor: UIColor = #colorLiteral(red: 0.9921568627, green: 0.3568627451, blue: 0.3725490196, alpha: 1)
    static let bottomColor: UIColor = #colorLiteral(red: 0.8980392157, green: 0, blue: 0.4470588235, alpha: 1)
    static let colors: [UIColor] = [topColor, bottomColor]
}
struct SelectPhotoButton {
    static let size: CGSize = .init(height: 275)
}
struct RegisterButton {
    static let size: CGSize = .init(height: InputTextField.size.height)
    static let backgroundColor: UIColor = #colorLiteral(red: 0.8235294118, green: 0, blue: 0.3254901961, alpha: 1)
}

struct InputTextField {
    static let size: CGSize = .init(height: 44)
    static let padding: CGFloat = 24
}
