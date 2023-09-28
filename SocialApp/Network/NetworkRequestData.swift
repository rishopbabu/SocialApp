//
//  NetworkRequestData.swift
//  SocialApp
//
//  Created by Mac-OBS-51 on 28/09/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct NetworkRequest {
    let method: HTTPMethod?
    let authorizationToken: String?
    let formData: [String: String]?
    let params: [String: Any]?
}
