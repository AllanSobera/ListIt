//
//  URLRequest+extension.swift
//  Core
//
//  Created by Allan Carlos Soberanski on 20/10/24.
//

import Foundation

public extension URLRequest {
    static func from(httpRequest: HTTPRequesting, authToken: String? = nil) -> URLRequest {
        let httpReq: String = httpRequest.baseURL.string ?? ""
        var urlComponents = URLComponents(string: httpReq)!
        urlComponents.queryItems = httpRequest.queryItems
        urlComponents.path = httpRequest.endpoint
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.timeoutInterval = 10
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        httpRequest.header?.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        if let authToken = authToken {
            urlRequest.setValue("bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        urlRequest.httpBody = try? httpRequest.body?.toData()
        urlRequest.httpMethod = httpRequest.method.rawValue
        
        return urlRequest
    }
}
