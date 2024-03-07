//
//  LoginPageController.swift
//  CountryApp
//
//  Created by Ziyadkhan on 05.03.24.
//

import UIKit
import SnapKit

class LoginPageController: UIViewController {
    
    lazy var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "atl")
        logo.contentMode = .scaleAspectFill
        return logo
    }()
    
    lazy var emailView: UIView = {
        return reusableView(color: .clear,
                            borderWith: 0.4,
                            borderColor: UIColor.black.cgColor,
                            cornerRadius: 16,
                            height: 40, width: 300)
    }()
    
    lazy var passwordView: UIView = {
        return reusableView(color: .clear,
                            borderWith: 0.4,
                            borderColor: UIColor.black.cgColor,
                            cornerRadius: 16,
                            height: 40, width: 300)
    }()
    
    lazy var emailTextField: UITextField = {
        return reusableTextField(placeholder: "Email",
                                 keyboardType: .emailAddress,
                                 isSecureTextEntry: false,
                                 borderStyle: .none)
    }()
    
    lazy var passwordTextField: UITextField = {
        return reusableTextField(placeholder: "Password",
                                 keyboardType: .default,
                                 isSecureTextEntry: true,
                                 borderStyle: .none)
    }()
    
    lazy var loginButton: UIButton = {
        return reusableButton(title: "Login",
                              titleColour: .white,
                              fontName: "Helvetica Neue Bold",
                              size: 20,
                              backgroundColour: UIColor(red: 115/255, green: 212/255, blue: 108/255, alpha: 1),
                              targetAction: #selector(loginTapped),
                              controlEvent: .touchUpInside,
                              cornerRadius: 16)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configConstraints()
    }
    
}
//MARK: Functions
extension LoginPageController {
    
    func configUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(logoImageView)
        view.addSubview(emailView)
        view.addSubview(passwordView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    func configConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(90)
            make.height.equalTo(180)
            make.width.equalTo(180)
        }
        
        emailView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).inset(-10)
            make.centerX.equalTo(logoImageView)
        }
        
        passwordView.snp.makeConstraints { make in
            make.top.equalTo(emailView.snp.bottom).inset(-16)
            make.centerX.equalTo(emailView)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.center.equalTo(emailView)
            make.left.equalTo(emailView.snp.left).inset(12)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.center.equalTo(passwordView)
            make.left.equalTo(passwordView.snp.left).inset(12)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordView.snp.bottom).inset(-16)
            make.centerX.equalTo(passwordView)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
    
    @objc private func loginTapped() {
        if let password = passwordTextField.text,
           let email = emailTextField.text,
           !email.isEmpty,
           !password.isEmpty {
            if password.count >= 5 && password.count <= 10 {
                showCountryPage()
            } else {
                showAlert(title: "Error", message: "You entered wrong password")
            }
        } else {
            showAlert(title: "Error", message: "You did not entered email or password")
        }
    }
}


//MARK: Reusable Functions
extension LoginPageController {
    
    func reusableTextField(placeholder: String, keyboardType: UIKeyboardType, isSecureTextEntry: Bool, borderStyle: UITextField.BorderStyle) -> UITextField {
        
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.borderStyle = borderStyle
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = isSecureTextEntry
        textField.font = .systemFont(ofSize: 12)
        
        return textField
    }
    
    func reusableView(color: UIColor,
                      borderWith: CGFloat,
                      borderColor: CGColor,
                      cornerRadius: CGFloat,
                      height: Int, width: Int) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.borderWidth = borderWith
        view.layer.borderColor = borderColor
        view.layer.cornerRadius = cornerRadius
        view.snp.makeConstraints { make in
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        return view
    }
    
    private func reusableButton(title: String,
                                titleColour: UIColor,
                                fontName: String,
                                size: CGFloat,
                                backgroundColour: UIColor,
                                targetAction: Selector,
                                controlEvent: UIControl.Event,
                                cornerRadius: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColour, for: .normal)
        button.titleLabel?.font = UIFont(name: fontName, size: size)
        button.backgroundColor = backgroundColour
        button.addTarget(self, action: targetAction, for: controlEvent)
        button.layer.cornerRadius = cornerRadius
        
        return button
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Okay", style: .default)
        alertController.addAction(okayButton)
        present(alertController, animated: true)
    }
    
    func showCountryPage() {
        let coordinator = CountryPageCoordinator(navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
}
