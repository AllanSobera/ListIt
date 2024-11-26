//
//  UITableView+Extension.swift
//  Core
//
//  Created by Allan Carlos Soberanski on 24/10/24.
//

import UIKit

extension UITableViewCell: ReusableView { }

extension UITableViewHeaderFooterView: ReusableView { }

public extension UITableView {

	func register<T: UITableViewCell>(cellOfType cellType: T.Type) {
		register(cellType, forCellReuseIdentifier: T.reuseIdentifier)
	}

    func register<T: UITableViewHeaderFooterView>(headerOrFooterViewOfType viewType: T.Type) {
        register(viewType, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(ofType: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue view with identifier: \(T.reuseIdentifier)")
        }
        return view
    }

	func dequeueReusableCell<T: UITableViewCell>(ofType cellType: T.Type, for indexPath: IndexPath) -> T {
		guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
			fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
		}
		return cell
	}

	func dequeueReusableCell<T: UITableViewCell>(ofType cellType: T.Type, for row: Int) -> T {
		let indexPath = IndexPath(row: row, section: 0)
		return dequeueReusableCell(ofType: cellType, for: indexPath)
	}

}
