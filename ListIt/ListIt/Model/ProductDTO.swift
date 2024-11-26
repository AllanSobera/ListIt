//
//  Product.swift
//  ListIt
//
//  Created by Allan Carlos Soberanski on 24/10/24.
//
import Foundation

struct ProductDTO: Decodable {
    let id: Int
    let name: String
    let image: String
    let category: String
    
    enum codingKeys: String, CodingKey {
        case id
        case name
        case image
        case category
    }
}
