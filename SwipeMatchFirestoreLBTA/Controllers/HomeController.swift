//
//  HomeController.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/1/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    private let topStackView = TopNavigationStackView()
    private let buttonsStackView = HomeBottomControlsStackView()
    private let cardsDeckView: UIView = UIView()

    private let cardViewModelsList = CardViewModelsList()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupLayout()
        setupDummyCards()
    }

    // MARK: - Fileprivate
    fileprivate func setupDummyCards() {
        cardViewModelsList.cardViewModels.forEach { (cardViewModel) in
            let cardView = CardView()
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
            cardView.cardViewModel = cardViewModel
        }
    }

    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonsStackView],
                                    axis: .vertical, margins: .init(horizontal: 12))
        view.addSubview(overallStackView)
        overallStackView.fillSuperSafeAreaView()

        overallStackView.bringSubviewToFront(cardsDeckView)
    }
}
