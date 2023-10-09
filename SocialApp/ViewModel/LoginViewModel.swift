//
//  LoginViewModel.swift
//  SocialApp
//
//  Created by Rishop Babu on 06/10/23.
//

import Foundation

class LoginViewModel {
    
    var loginModel: LoginModel?
    
    
    func loginRequest(userName: String, password: String, completion: @escaping (Bool) -> Void) {
        
        guard let loginURL = URL(string: URLConstants.loginURL) else {
            return print("invalid url")
        }
        
        let formData: [String: String] = ["username": userName, "password": password]
        
        let request = NetworkRequest(method: .post, authorizationToken: nil, formData: formData, params: nil)
        
        NetworkManager.shared.sendRequest(url: loginURL, requestData: request, responseType: LoginModel.self) { (result) in
            switch result {
                case .success(let data):
                    if let loginModel = data {
                        self.loginModel = loginModel
                        completion(true)
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    completion(false)
            }
        }
    }
}
