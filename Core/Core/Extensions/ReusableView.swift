//
//  ReusableView.swift
//  Core
//
//  Created by Allan Carlos Soberanski on 24/10/24.
//


import UIKit

protocol ReusableView: AnyObject {

	static var reuseIdentifier: String { get }

}

extension ReusableView where Self: UIView {

	static var reuseIdentifier: String {
		String(describing: Self.self)
	}

}
