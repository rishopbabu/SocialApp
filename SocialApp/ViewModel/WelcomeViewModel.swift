//
//  WelcomeViewModel.swift
//  SocialApp
//
//  Created by Rishop Babu on 28/09/23.
//

import Foundation

class WelcomeViewModel {
    private let welcomeURL = URL(string: "http://localhost:8000/")!
    var welcomeModel: WelcomeModel?
    
    func getApiData(completon: @escaping () -> ()) {
        URLSession.shared.dataTask(with: welcomeURL) { [weak self] (data, response, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let finalData = try! jsonDecoder.decode(WelcomeModel.self, from: data)
                self?.welcomeModel = finalData
                print("Welcome Data:", finalData)
                completon()
            }
            // Add a print statement here to check if this block is executed more than once.
            print("Completion handler executed.")
        }.resume()
    }
}
