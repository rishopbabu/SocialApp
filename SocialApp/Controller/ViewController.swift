//
//  ViewController.swift
//  SocialApp
//
//  Created by Rishop Babu on 28/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = WelcomeViewModel()
    var wellcomeData: WelcomeModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.performNetworkRequest()
        
    }


}

