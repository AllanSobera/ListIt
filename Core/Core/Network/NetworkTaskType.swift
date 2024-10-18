//
//  NetworkTaskType.swift
//  Core
//
//  Created by Premiersoft on 17/10/24.
//

import Foundation

public enum NetworkTaskType {
    case plain
    case requestJSONEncodable(Encodable)
    case multiPartFormData(Data)
}
