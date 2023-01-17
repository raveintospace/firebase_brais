//
//  LogedView.swift
//  Firebase_Brais
//
//  Created by Uri on 17/1/23.
//  
//

import Foundation
import UIKit

enum ProviderType: String {
    case basic
}

final class LogedView: UIViewController {

    // MARK: - Properties
    var presenter: LogedPresenterProtocol?
    
    var safeArea: UILayoutGuide!
    let emailLabel = UILabel()
    let providerLabel = UILabel()
    let logoutButton = UIButton()
    
    private let email: String
    private let provider: ProviderType

    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension LogedView: LogedViewProtocol {
    
    // MARK: - View Layout
    func setupLogedView() {
        self.navigationItem.title = "Loged in view"
        safeArea = view.layoutMarginsGuide
        setupemailLabel()
        setupProviderLabel()
    }
    
    func setupemailLabel() {
        view.addSubview(emailLabel)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
        emailLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.75).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emailLabel.text = "Email"
        emailLabel.layer.cornerRadius = 10
    }
    
    func setupProviderLabel() {
        view.addSubview(providerLabel)
        
        providerLabel.translatesAutoresizingMaskIntoConstraints = false
        providerLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 3).isActive = true
        providerLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        providerLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.75).isActive = true
        providerLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        providerLabel.text = "Provider"
        providerLabel.layer.cornerRadius = 10
    }
    
    func setupLogoutButton() {
        view.addSubview(logoutButton)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.topAnchor.constraint(equalTo: providerLabel.bottomAnchor, constant: 6).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.75).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        logoutButton.backgroundColor = .orange
        logoutButton.layer.cornerRadius = 10
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
    }
    
}
