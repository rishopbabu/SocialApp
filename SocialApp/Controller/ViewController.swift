//
//  ViewController.swift
//  SocialApp
//
//  Created by Rishop Babu on 28/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    private weak var titleLabel: UILabel!
    
    private weak var messageLabel: UILabel!
    
    var viewModel = WelcomeViewModel()
    var wellcomeData: WelcomeModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupViews()
        
        viewModel.welcomeModel = { [weak self] data in
            self?.wellcomeData = data
            DispatchQueue.main.async {
                self?.messageLabel.text = self?.wellcomeData?.message
            }
        }
        viewModel.performNetworkRequest()
    }
    
    private func setupViews() {
        let titleLabelItem = UILabel()
        titleLabelItem.translatesAutoresizingMaskIntoConstraints = false
        titleLabelItem.textColor = .white
        titleLabelItem.font = .systemFont(ofSize: 20)
        titleLabelItem.text = "Message:"
        titleLabelItem.textAlignment = .left
        titleLabelItem.numberOfLines = 0
        self.titleLabel = titleLabelItem
        self.view.addSubview(titleLabelItem)
        
        let messageLabelItem = UILabel()
        messageLabelItem.translatesAutoresizingMaskIntoConstraints = false
        messageLabelItem.textColor = .white
        messageLabelItem.font = .systemFont(ofSize: 20)
        messageLabelItem.textAlignment = .left
        messageLabelItem.numberOfLines = 0
        self.messageLabel = messageLabelItem
        self.view.addSubview(messageLabelItem)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            
            messageLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            messageLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 5)
        ])
        
    }


}

