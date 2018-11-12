//
//  RegistrationController.swift
//  SwipeMatchFirestoreLBTA
//
//  Created by John Martin on 11/11/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    private let gradientLayer = CAGradientLayer(colors: RegistrationGradientLayer.colors, locations: [0, 1])

    private let selectPhotoButton: UIButton = { (_ height: CGFloat) in
        let button: UIButton = .systemButton(title: "Select Photo",
                                             titleColor: .black,
                                             backgroundColor: .white,
                                             font: .systemFont(ofSize: 32, weight: .heavy),
                                             cornerRadius: 16)
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
        return button
    }(SelectPhotoButton.size.height)

    private let fullNameTextField: CustomTextField = { (_ height: CGFloat, _ padding: CGFloat) in
        let textField = CustomTextField(padding: padding, height: height)
        textField.placeholder = "Enter full name"
        textField.autocapitalizationType = .words
        return textField
    }(InputTextField.size.height, InputTextField.padding)

    private let emailTextField: CustomTextField = { (_ height: CGFloat, _ padding: CGFloat) in
        let textField = CustomTextField(padding: padding, height: height)
        textField.placeholder = "Enter email"
        textField.keyboardType = .emailAddress
        return textField
    }(InputTextField.size.height, InputTextField.padding)

    private let passwordTextField: CustomTextField = { (_ height: CGFloat, _ padding: CGFloat) in
        let textField = CustomTextField(padding: padding, height: height)
        textField.placeholder = "Enter password"
        textField.isSecureTextEntry = true
        return textField
    }(InputTextField.size.height, InputTextField.padding)

    private let registerButton: UIButton = { (_ height: CGFloat, _ backgroundColor: UIColor) in
        let button: UIButton = .systemButton(title: "Register",
                                            titleColor: .white,
                                            backgroundColor: backgroundColor,
                                            font: .systemFont(ofSize: 16, weight: .heavy),
                                            cornerRadius: 22)
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
        return button
    }(RegisterButton.size.height, RegisterButton.backgroundColor)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let stackView: UIStackView = UIStackView(arrangedSubviews: [
                                                                    selectPhotoButton,
                                                                    fullNameTextField,
                                                                    emailTextField,
                                                                    passwordTextField,
                                                                    registerButton
                                                                    ],
                                                 axis: .vertical, spacing: 8)

        view.addSubviews(gradientLayer, stackView)

        stackView.anchor(leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(horizontal: 50))
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
}
