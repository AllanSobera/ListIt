//
//  NetworkTarget.swift
//  Core
//
//  Created by Allan Soberanski on 17/10/24.
//

import Foundation

public protocol HTTPRequesting {
    var endpoint: String { get }
    var queryItems: [URLQueryItem]? { get set }
    var method: HTTPMethod { get }
    var body: Encodable? { get }
    var header: [String: String?]? { get }
}

extension HTTPRequesting {

    public var baseURL: URLComponents {
        return URLManager.baseUrl
    }

    public var queryItems: [URLQueryItem]? {
        return nil
    }
    
    public var headers: [String: String]? {
        let headers: [String: String]? = ["Content-Type": "application/json"]
        return headers
    }
    
}

public class HTTPRequestBuilder: HTTPRequesting {
    public var queryItems: [URLQueryItem]?
    public var endpoint: String
    public var method: HTTPMethod
    public var body: (any Encodable)?
    public var header: [String : String?]?
    
    
    public init(endpoint: String, method: HTTPMethod) {
        self.endpoint = endpoint
        self.method = method
    }
    
    public func withQueryItem(queryItems: [URLQueryItem]) -> HTTPRequestBuilder {
        self.queryItems = queryItems
        return self
    }
    
    public func withBody(body: Encodable) -> HTTPRequestBuilder {
        self.body = body
        return self
    }
    
    public func withHeader(key: String, value: String) -> HTTPRequestBuilder {
        if var header = header {
            header[key] = value
            self.header = header
        } else {
            header = [key: value]
        }
        
        return self
    }
    
    public func build() -> HTTPRequest {
        return HTTPRequest(
            endpoint: endpoint,
            header: header,
            baseURL: baseURL,
            queryItems: queryItems,
            method: method,
            body: body
        )
    }
}

public struct HTTPRequest: HTTPRequesting {
    public var endpoint: String
    public var header: [String : String?]?
    public var baseURL: URLComponents
    public var queryItems: [URLQueryItem]?
    public var method: HTTPMethod
    public var body: (any Encodable)?
}


public class URLManager {
    static let baseUrl: URLComponents = URLComponents(string: "")!
}
