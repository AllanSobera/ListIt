//
//  ASButton.swift
//
//
//  Created by Allan Soberanski on 11/10/24.
//

import UIKit
import Core

public final class ASButton: UIButton {
    public init() {
        super.init(frame: .zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
