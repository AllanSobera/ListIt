//
//  ProductViewModel.swift
//  SupermarketList
//
//  Created by Premiersoft on 06/10/24.
//

import Foundation

protocol ProductViewModelDelegate: AnyObject {
    func reloadData()
    func showError(error: ErrorRequest)
}

final class ProductViewModel {
    var product: [Product] = []
    private let service = ProductService()
    weak var delegate: ProductViewModelDelegate?
    
    func getProduct() {
        service.getProduct { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let success):
                self.product = success
                self.delegate?.reloadData()
            case .failure(let failure):
                self.delegate?.showError(error: failure)
            }
        }
    }
}
