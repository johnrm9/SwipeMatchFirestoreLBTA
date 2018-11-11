//
//  Advertiser+ProducesCardViewModel.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/6/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension Advertiser: ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel {
        let attributedString = NSMutableAttributedString(string: title, attributes: [.font: UIFont.titleFont])
        attributedString.appendNewLine()
        attributedString.append(NSAttributedString(string: brandName, attributes: [.font: UIFont.brandNameFont]))
        return CardViewModel(imageNames: [posterPhotoName], attributedString: attributedString, textAlignment: .center)
    }
}

fileprivate extension UIFont {
    static var titleFont: UIFont {
        return .systemFont(ofSize: 34, weight: .heavy)
    }
    static var brandNameFont: UIFont {
        return .systemFont(ofSize: 24, weight: .bold)
    }
}
