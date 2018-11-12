//
//  HomeController.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/1/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import GestureRecognizerClosures
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

        setupTopButtonsHandlers()
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

    fileprivate func setupTopButtonsHandlers() {
        for subview in topStackView.subviews where TopButtons.foundTag(rawValue: subview.tag) {
            let button: UIButton = subview as! UIButton
            button.onTap {_ in self.handleTopButtons(button) }
        }
    }

    fileprivate func handleTopButtons(_ sender: UIButton) {
        guard let topButton = TopButtons(rawValue: sender.tag) else { return }
        switch topButton {
        case .settings: handleSettings()
        case .message: handleMessage()
        }
    }

    fileprivate func handleSettings() {
        let registrationController = RegistrationController()
        present(registrationController, animated: true)
    }

    fileprivate func handleMessage() {
        print(#function)
    }
}
