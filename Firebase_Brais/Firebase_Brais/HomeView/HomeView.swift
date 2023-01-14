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
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var loginButton = UIButton()
    var cancelButton = UIButton()
    
    let centeredParagraphStyle = NSMutableParagraphStyle()

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
    }
    
    func setupEmailTextField() {
        view.addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.75).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    
        emailTextField.backgroundColor = .cyan
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter your email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        emailTextField.textColor = .black
        emailTextField.textAlignment = .center
    }
}
