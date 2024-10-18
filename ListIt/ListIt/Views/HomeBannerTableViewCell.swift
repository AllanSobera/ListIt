//
//  File.swift
//  SupermarketList
//
//  Created by Premiersoft on 06/10/24.
//

import UIKit

final class HomeBannerTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    
    private let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(type: HomeBannerType) {
        titleLabel.text = type.title
        view.backgroundColor = type.backgroudColor
    }
    
    private func setupView() {
        view.layer.cornerRadius = 16
        contentView.addSubview(view)
        view.addSubview(titleLabel)
        
        let screenWidth = window?.screen.bounds.width
        let borderSpace = (screenWidth ?? 200) - 40
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            view.heightAnchor.constraint(equalToConstant: 140),
            view.widthAnchor.constraint(equalToConstant: borderSpace),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
