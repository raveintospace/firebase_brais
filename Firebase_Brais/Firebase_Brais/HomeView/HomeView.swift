//
//  HomeView.swift
//  Firebase_Brais
//
//  Created by Uri on 14/1/23.
//  
//

import Foundation
import UIKit
import FirebaseAnalytics

final class HomeView: UIViewController {

    // MARK: - Properties
    var presenter: HomePresenterProtocol?
    
    var safeArea: UILayoutGuide!
    let centeredParagraphStyle = NSMutableParagraphStyle()
    
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var loginButton = UIButton()
    var cancelButton = UIButton()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = UIColor(red: 236/255, green: 239/255, blue: 241/255, alpha: 1)
        
        // Analytics event
        Analytics.logEvent("InitScreen", parameters: ["message": "Firebase integration complete"])
    }
}

// MARK: - Extensions

extension HomeView: HomeViewProtocol {

    func setupHomeView() {
        safeArea = view.layoutMarginsGuide
        centeredParagraphStyle.alignment = .center
        setupEmailTextField()
        setupPasswordTextField()
    }
    
    func setupEmailTextField() {
        view.addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.75).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emailTextField.configureLoginTextField()
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter your email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
    }
    
    func setupPasswordTextField() {
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 3).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.75).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordTextField.configureLoginTextField()
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter your password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        passwordTextField.isSecureTextEntry = true
    }
}
