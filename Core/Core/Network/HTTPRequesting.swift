//
//  NetworkTarget.swift
//  Core
//
//  Created by Premiersoft on 17/10/24.
//

import Foundation

public protocol HTTPRequesting {

    var baseURL: URLComponents { get }

    var endpoint: String { get }

    var method: NetworkHTTPMethod { get }

    var headers: [String: String]? { get set }

    var queryItems: [URLQueryItem]? { get }
    
}

extension HTTPRequesting {

    public var baseURL: URLComponents {
        return URLManager.baseUrl
    }

    public var queryItems: [URLQueryItem]? {
        return nil
    }
    
    public var headers: [String: String]? {
        var headers: [String: String]? = ["Content-Type": "application/json"]
        return headers
    }
    
}

public class HTTPRequest: HTTPRequesting {
    public var headers: [String : String]?
    public var endpoint: String
    public var method: NetworkHTTPMethod
    
    init(endpoint: String, method: NetworkHTTPMethod) {
        self.endpoint = endpoint
        self.method = method
    }
    
    public func withHeader(key: String, value: String) -> HTTPRequesting {
        if var header = headers {
            header[key] = value
            self.headers = header
        } else {
            headers = [key: value]
        }
        return self
    }
    
    
}




public class URLManager {
    static var baseUrl: URLComponents = URLComponents(string: "")!
}
