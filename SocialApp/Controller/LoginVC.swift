//
//  ViewController.swift
//  SocialApp
//
//  Created by Rishop Babu on 28/09/23.
//

import UIKit

class LoginVC: UIViewController {
    
    private weak var imageBackground: UIImageView!
    
    private weak var titleLabel: UILabel!
    
    private weak var emailTextField: UITextField!
    
    private weak var passwordTextField: UITextField!
    
    private weak var showPassword: UIButton!
    
    private weak var loginButton: UIButton!
    
    private weak var noAccountLabel: UILabel!
    
    private weak var createAccountButton: UIButton!
    
    
    
    var viewModel: WelcomeViewModel = WelcomeViewModel()
    
    var loginModel: LoginViewModel = LoginViewModel()
    
    var wellcomeData: WelcomeModel?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .lightGray
        
        viewModel.welcomeModel = { [weak self] data in
            self?.wellcomeData = data
            DispatchQueue.main.async {
                
            }
        }
        
        viewModel.performNetworkRequest()
    }
    
    
    // MARK: - User interactions
    
    @objc private func loginButtonAction() {
        
        guard let username = emailTextField.text, !username.isEmpty else {
            let alert = UIAlertController(title: "Login Failed", message: "Please enter a username", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            let alert = UIAlertController(title: "Login Failed", message: "Please enter a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        loginModel.loginRequest(userName: username, password: password) { success in
            if success {
                DispatchQueue.main.async {
                    let homeVC = SignupVC()
                    self.navigationController?.setNavigationBarHidden(true, animated: true)
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
            } else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Login Failed", message: "Invalid Credentials", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    @objc private func createAccountButtonAction() {
        let homeVC = SignupVC()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    
    // MARK: - Networks
    
    
    // MARK: - UI and constraints methods
    
    private func setupViews() {
        
        let imageBackgroundItem = UIImageView()
        imageBackgroundItem.translatesAutoresizingMaskIntoConstraints = false
        imageBackgroundItem.image = UIImage(named: "background2")
        imageBackgroundItem.contentMode = .scaleAspectFill
        self.imageBackground = imageBackgroundItem
        self.view.addSubview(imageBackgroundItem)
        
        let titleLabelItem = UILabel()
        titleLabelItem.translatesAutoresizingMaskIntoConstraints = false
        titleLabelItem.textColor = .white
        titleLabelItem.font = .systemFont(ofSize: 35)
        titleLabelItem.text = StringConstants.login
        titleLabelItem.textAlignment = .center
        titleLabelItem.numberOfLines = 0
        self.titleLabel = titleLabelItem
        self.view.addSubview(titleLabelItem)
        
        let useremailItem = UITextField()
        useremailItem.translatesAutoresizingMaskIntoConstraints = false
        useremailItem.backgroundColor = .clear
        useremailItem.placeholder = StringConstants.email
        useremailItem.textColor = .white
        useremailItem.keyboardType = .emailAddress
        useremailItem.autocapitalizationType = .none
        useremailItem.autocorrectionType = .no
        useremailItem.layer.cornerRadius = 10
        useremailItem.borderStyle = .bezel
        useremailItem.setPlaceholderTextColor(.white)
        self.emailTextField = useremailItem
        self.view.addSubview(useremailItem)
        
        let passwordItem = UITextField()
        passwordItem.translatesAutoresizingMaskIntoConstraints = false
        passwordItem.backgroundColor = .clear
        passwordItem.placeholder = StringConstants.password
        passwordItem.textColor = .white
        passwordItem.isSecureTextEntry = true
        passwordItem.keyboardType = .emailAddress
        passwordItem.autocapitalizationType = .none
        passwordItem.autocorrectionType = .no
        passwordItem.layer.cornerRadius = 10
        passwordItem.borderStyle = .bezel
        passwordItem.setPlaceholderTextColor(.white)
        self.passwordTextField = passwordItem
        self.view.addSubview(passwordItem)
        
        let loginButtonItem = UIButton()
        loginButtonItem.translatesAutoresizingMaskIntoConstraints = false
        loginButtonItem.setTitle(StringConstants.login, for: .normal)
        loginButtonItem.backgroundColor = .systemGray
        loginButtonItem.layer.cornerRadius = 20
        loginButtonItem.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        self.loginButton = loginButtonItem
        self.view.addSubview(loginButtonItem)
        
        let noAccountLabelItem = UILabel()
        noAccountLabelItem.translatesAutoresizingMaskIntoConstraints = false
        noAccountLabelItem.text = StringConstants.noAccount
        noAccountLabelItem.textColor = .cyan
        noAccountLabelItem.font = .systemFont(ofSize: 15)
        noAccountLabelItem.textAlignment = .center
        noAccountLabelItem.numberOfLines = 0
        self.noAccountLabel = noAccountLabelItem
        self.view.addSubview(noAccountLabelItem)
        
        let createAccountButtonItem = UIButton()
        createAccountButtonItem.translatesAutoresizingMaskIntoConstraints = false
        createAccountButtonItem.setTitle(StringConstants.createAccount, for: .normal)
        createAccountButtonItem.backgroundColor = .lightGray
        createAccountButtonItem.layer.cornerRadius = 20
        createAccountButtonItem.addTarget(self, action: #selector(createAccountButtonAction), for: .touchUpInside)
        self.createAccountButton = createAccountButtonItem
        self.view.addSubview(createAccountButtonItem)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            imageBackground.topAnchor.constraint(equalTo: view.topAnchor),
            imageBackground.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageBackground.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageBackground.safeAreaLayoutGuide.topAnchor, constant: 150),
            titleLabel.leftAnchor.constraint(equalTo: imageBackground.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            emailTextField.leftAnchor.constraint(equalTo: imageBackground.leftAnchor, constant: 10),
            emailTextField.rightAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: -10),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leftAnchor.constraint(equalTo: imageBackground.leftAnchor, constant: 10),
            passwordTextField.rightAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: -10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            loginButton.leftAnchor.constraint(equalTo: imageBackground.leftAnchor, constant: 100),
            loginButton.rightAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: -100),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            noAccountLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            noAccountLabel.leftAnchor.constraint(equalTo: imageBackground.leftAnchor, constant: 20),
            noAccountLabel.rightAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: -20),
            
            createAccountButton.topAnchor.constraint(equalTo: noAccountLabel.bottomAnchor, constant: 15),
            createAccountButton.leftAnchor.constraint(equalTo: imageBackground.leftAnchor, constant: 100),
            createAccountButton.rightAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: -100),
            createAccountButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }


}

