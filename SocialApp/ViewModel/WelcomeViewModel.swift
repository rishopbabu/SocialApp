//
//  WelcomeViewModel.swift
//  SocialApp
//
//  Created by Rishop Babu on 28/09/23.
//

import Foundation

class WelcomeViewModel {
    
    var welcomeModel: WelcomeModel?
    
    func performNetworkRequest() {
        
        guard let exampleURL = URL(string: "http://localhost:8000/") else {
            print("Invalid URL")
            return
        }

        let requestData = NetworkRequest(method: .get, authorizationToken: nil, formData: nil, params: nil)

        NetworkManager.shared.sendRequest(url: exampleURL, requestData: requestData) { (result) in
            switch result {
            case .success(let data):
                if let responseData = data {
                    if let responseString = String(data: responseData, encoding: .utf8) {
                        print("Received response data: \(responseString)")
                    } else {
                        print("Received response data, but unable to decode to string.")
                    }
                } else {
                    print("Received empty response data")
                }

            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    

}
