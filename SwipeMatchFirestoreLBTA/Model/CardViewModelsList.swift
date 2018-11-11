//
//  CardViewModelsList.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/5/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import Foundation

class CardViewModelsList {
    private let _cardViewModels: [CardViewModel]

    subscript(index: Int) -> CardViewModel {
        return _cardViewModels[index]
    }

    var count: Int {
        return _cardViewModels.count
    }

    var cardViewModels: [CardViewModel] {
        return _cardViewModels
    }

    init() {
        let producers = [
            User(name: "Kelly", age: 23, profession: "Music DJ", imageNames: ["kelly1", "kelly2", "kelly3"]),
            Advertiser(title: "Slide Out Menu", brandName: "Lets Build That App", posterPhotoName: "slide_out_menu_poster"),
            User(name: "Jane", age: 18, profession: "Teacher", imageNames: ["jane1", "jane2", "jane3"])
            ] as [ProducesCardViewModel]

        _cardViewModels = producers.map { $0.toCardViewModel() }
    }
}
