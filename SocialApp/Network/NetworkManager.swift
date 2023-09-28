//
//  NetworkManager.swift
//  SocialApp
//
//  Created by Rishop Babu on 28/09/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    typealias CompletionHandler<T> = (Result<T?, NetworkError>) -> Void
    
    private let session: URLSession
    
    init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    func sendRequest<T: Codable>(url: URL, requestData: NetworkRequest, responseType: T.Type,  completion: @escaping CompletionHandler<T>) {
        var request = URLRequest(url: url)
        request.httpMethod = requestData.method?.rawValue
        
        // Set authorization header
        if let token = requestData.authorizationToken {
            let authorizationHeaderValue = "Bearer \(token)"
            request.addValue(authorizationHeaderValue, forHTTPHeaderField: "Authorization")
        }
        
        // Set content type based on form data or JSON params
        if let formData = requestData.formData {
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpBody = formData.queryString.data(using: .utf8)
        } else if let params = requestData.params {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            if let paramsData = try? JSONSerialization.data(withJSONObject: params, options: []) {
                request.httpBody = paramsData
            }
        }
        
        let task = session.dataTask(with: request) { [weak self] (data, response, error) in
            guard self != nil else {
                completion(.failure(.networkManagerDeallocated))
                return
            }
            
            if let error = error {
                completion(.failure(.requestFailed(statusCode: -1, message: error.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            
            if (200..<300).contains(httpResponse.statusCode) {
                            if let responseData = data {
                                do {
                                    let decodedModel = try JSONDecoder().decode(T.self, from: responseData)
                                    completion(.success(decodedModel))
                                } catch {
                                    completion(.failure(.requestFailed(statusCode: httpResponse.statusCode, message: "Failed to decode response data: \(error.localizedDescription)")))
                                }
                            } else {
                                completion(.success(nil))
                            }
                        } else {
                            completion(.failure(.requestFailed(statusCode: httpResponse.statusCode, message: "HTTP status code \(httpResponse.statusCode)")))
                        }
        }
        task.resume()
    }
}

extension Dictionary where Key == String, Value == String {
    var queryString: String {
        var components = URLComponents()
        components.queryItems = self.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components.percentEncodedQuery ?? ""
    }
}

enum NetworkError: Error {
    case networkManagerDeallocated
    case invalidURL
    case unknown
    case requestFailed(statusCode: Int, message: String)
    
    var localizedDescription: String {
            switch self {
            case .networkManagerDeallocated:
                return "Network manager instance deallocated."
            case .invalidURL:
                return "Invalid URL."
            case .unknown:
                return "Unknown error."
            case .requestFailed(_, let message):
                return "Request failed with error: \(message)"
            }
        }
}
