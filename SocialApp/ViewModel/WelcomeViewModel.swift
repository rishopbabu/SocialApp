//
//  WelcomeViewModel.swift
//  SocialApp
//
//  Created by Rishop Babu on 28/09/23.
//

import Foundation

class WelcomeViewModel {
    
    var welcomeModel: ((WelcomeModel?) -> Void)?
    
    func performNetworkRequest() {
        
        guard let exampleURL = URL(string: "http://localhost:8000/") else {
            print("Invalid URL")
            return
        }

        let requestData = NetworkRequest(method: .get, authorizationToken: nil, formData: nil, params: nil)

        NetworkManager.shared.sendRequest(url: exampleURL, requestData: requestData, responseType: WelcomeModel.self) { (result) in
            switch result {
            case .success(let data):
                self.welcomeModel?(data)
                print("data:", data as Any)
                
                if data != nil {
                        print("Received response: \(String(describing: data))")
                    } else {
                        print("Received nil response")
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                
            }
        }
    }

    

}
