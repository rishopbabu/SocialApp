//
//  SignupVC.swift
//  SocialApp
//
//  Created by Rishop Babu on 04/10/23.
//

import Foundation
import UIKit

class SignupVC: UIViewController {
    
    // MARK: - UI Elements
    
    private weak var titleLabel: UILabel!
    
    private weak var firstNameTextField: UITextField!
    
    private weak var lastNameTextField: UITextField!
    
    private weak var emailTextField: UITextField!
    
    private weak var phoneTextField: UITextField!
    
    private weak var passwordTextField: UITextField!
    
    private weak var createAccountButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        
        
        let titleLabelItem = UILabel()
        titleLabelItem.translatesAutoresizingMaskIntoConstraints = false
        titleLabelItem.textColor = .white
        titleLabelItem.font = .systemFont(ofSize: 35)
        titleLabelItem.text = StringConstants.createAccount
        titleLabelItem.textAlignment = .center
        titleLabelItem.numberOfLines = 0
        self.titleLabel = titleLabelItem
        self.view.addSubview(titleLabelItem)
        
        let firstNameTextFieldItem = UITextField()
        firstNameTextFieldItem.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextFieldItem.backgroundColor = .clear
        firstNameTextFieldItem.placeholder = StringConstants.firstName
        firstNameTextFieldItem.textColor = .white
        firstNameTextFieldItem.keyboardType = .emailAddress
        firstNameTextFieldItem.autocapitalizationType = .none
        firstNameTextFieldItem.autocorrectionType = .no
        firstNameTextFieldItem.layer.cornerRadius = 10
        firstNameTextFieldItem.borderStyle = .bezel
        firstNameTextFieldItem.layer.borderColor = UIColor.blue.cgColor
        firstNameTextFieldItem.setPlaceholderTextColor(.white)
        self.firstNameTextField = firstNameTextFieldItem
        self.view.addSubview(firstNameTextFieldItem)
        
        let lastNameTextFieldItem = UITextField()
        lastNameTextFieldItem.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextFieldItem.backgroundColor = .clear
        lastNameTextFieldItem.placeholder = StringConstants.LastName
        lastNameTextFieldItem.textColor = .white
        lastNameTextFieldItem.keyboardType = .emailAddress
        lastNameTextFieldItem.autocapitalizationType = .none
        lastNameTextFieldItem.autocorrectionType = .no
        lastNameTextFieldItem.layer.cornerRadius = 10
        lastNameTextFieldItem.borderStyle = .bezel
        lastNameTextFieldItem.layer.borderColor = UIColor.blue.cgColor
        lastNameTextFieldItem.setPlaceholderTextColor(.white)
        self.lastNameTextField = lastNameTextFieldItem
        self.view.addSubview(lastNameTextFieldItem)
        
        let emailTextFieldItem = UITextField()
        emailTextFieldItem.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldItem.backgroundColor = .clear
        emailTextFieldItem.placeholder = StringConstants.email
        emailTextFieldItem.textColor = .white
        emailTextFieldItem.keyboardType = .emailAddress
        emailTextFieldItem.autocapitalizationType = .none
        emailTextFieldItem.autocorrectionType = .no
        emailTextFieldItem.layer.cornerRadius = 10
        emailTextFieldItem.borderStyle = .bezel
        emailTextFieldItem.layer.borderColor = UIColor.blue.cgColor
        emailTextFieldItem.setPlaceholderTextColor(.white)
        self.emailTextField = emailTextFieldItem
        self.view.addSubview(emailTextFieldItem)
        
        let phoneTextFieldItem = UITextField()
        phoneTextFieldItem.translatesAutoresizingMaskIntoConstraints = false
        phoneTextFieldItem.backgroundColor = .clear
        phoneTextFieldItem.placeholder = StringConstants.phone
        phoneTextFieldItem.textColor = .white
        phoneTextFieldItem.keyboardType = .emailAddress
        phoneTextFieldItem.autocapitalizationType = .none
        phoneTextFieldItem.autocorrectionType = .no
        phoneTextFieldItem.layer.cornerRadius = 10
        phoneTextFieldItem.borderStyle = .bezel
        phoneTextFieldItem.layer.borderColor = UIColor.blue.cgColor
        phoneTextFieldItem.setPlaceholderTextColor(.white)
        self.phoneTextField = phoneTextFieldItem
        self.view.addSubview(phoneTextFieldItem)
        
        let passwordTextFieldItem = UITextField()
        passwordTextFieldItem.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldItem.backgroundColor = .clear
        passwordTextFieldItem.isSecureTextEntry = true
        passwordTextFieldItem.placeholder = StringConstants.password
        passwordTextFieldItem.textColor = .white
        passwordTextFieldItem.keyboardType = .emailAddress
        passwordTextFieldItem.autocapitalizationType = .none
        passwordTextFieldItem.autocorrectionType = .no
        passwordTextFieldItem.layer.cornerRadius = 10
        passwordTextFieldItem.borderStyle = .bezel
        passwordTextFieldItem.layer.borderColor = UIColor.blue.cgColor
        passwordTextFieldItem.setPlaceholderTextColor(.white)
        self.passwordTextField = passwordTextFieldItem
        self.view.addSubview(passwordTextFieldItem)
        
        let createAccountButtonItem = UIButton()
        createAccountButtonItem.translatesAutoresizingMaskIntoConstraints = false
        createAccountButtonItem.setTitle(StringConstants.createAccount, for: .normal)
        createAccountButtonItem.backgroundColor = .red
        createAccountButtonItem.layer.cornerRadius = 20
        createAccountButtonItem.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        self.createAccountButton = createAccountButtonItem
        self.view.addSubview(createAccountButtonItem)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  30),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            firstNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            firstNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            firstNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 20),
            lastNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            lastNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 20),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            phoneTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            phoneTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            phoneTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            phoneTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            createAccountButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            createAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            createAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            createAccountButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    // MARK: - Button Actions
    
    @objc private func createAccountButtonTapped() {
        // Handle signup button tap
        // Perform validation and further actions as needed
        
        if let email = emailTextField.text, !email.isEmpty {
            if isValidEmail(email) {
                print("Valid email")
                
            } else {
                print("Invalid email")
                // Show alert for invalid email
            }
        } else {
            print("Please enter an email")
            // Show alert for empty email
        }
    }
    
    // MARK: - Validation Methods
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

