//
//  UICollectionView+extension.swift
//  Core
//
//  Created by Allan Carlos Soberanski on 24/10/24.
//


import UIKit

extension UICollectionReusableView: ReusableView { }

public extension UICollectionView {

	func register<T: UICollectionViewCell>(_ cellType: T.Type) {
		register(cellType, forCellWithReuseIdentifier: T.reuseIdentifier)
	}

	func dequeueReusableCell<T: UICollectionReusableView>(ofType cellType: T.Type, for indexPath: IndexPath) -> T {
		guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
			fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
		}
		return cell
	}

	func dequeueReusableCell<T: UICollectionReusableView>(ofType cellType: T.Type, for row: Int) -> T {
		let indexPath = IndexPath(row: row, section: 0)
		return dequeueReusableCell(ofType: cellType, for: indexPath)
	}

    func register<T: UICollectionReusableView>(_ viewClass: T.Type, forSupplementaryViewOfKind: String) {
        register(viewClass, forSupplementaryViewOfKind: forSupplementaryViewOfKind,
                 withReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofType view: T.Type,
                                                                       ofKind kind: String,
                                                                       indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind,
                                                          withReuseIdentifier: T.reuseIdentifier,
                                                          for: indexPath) as? T else {
            fatalError("Could not dequeue supplementary with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
}
