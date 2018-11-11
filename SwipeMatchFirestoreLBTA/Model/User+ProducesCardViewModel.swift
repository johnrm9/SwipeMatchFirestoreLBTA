//
//  User+ProducesCardViewModel.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/6/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

extension User: ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel {
        let attributedText = NSMutableAttributedString(string: name, attributes: [.font: UIFont.nameFont])
        attributedText.appendSpaces(2)
        let ageString = "\(age)"
        attributedText.append(NSAttributedString(string: ageString, attributes: [.font: UIFont.ageFont]))
        attributedText.appendNewLine()
        attributedText.append(NSAttributedString(string: profession, attributes: [.font: UIFont.professionFont]))
        return CardViewModel(imageNames: imageNames, attributedString: attributedText)
    }
}

fileprivate extension UIFont {
    static var nameFont: UIFont {
        return .systemFont(ofSize: 32, weight: .heavy)
    }
    static var ageFont: UIFont {
        return .systemFont(ofSize: 24, weight: .regular)
    }
    static var professionFont: UIFont {
        return .systemFont(ofSize: 20, weight: .regular)
    }
}
