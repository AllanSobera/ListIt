//
//  ProductViewModel.swift
//  SupermarketList
//
//  Created by Premiersoft on 06/10/24.
//

import Foundation
import Core

@MainActor
protocol ProductViewModelDelegate: AnyObject {
    func reloadData()
    func showError(error: ErrorRequest)
}

final class ProductViewModel {
    var product: [Product] = []
    private let service = ProductService()
    weak var delegate: ProductViewModelDelegate?
    
    @MainActor
    func getProduct() {
        Task { [weak self] in
            guard let self else { return }
            do {
                product = try await service.getProduct()
                delegate?.reloadData()
            } catch {
                let errorRequest = ErrorRequest(message: error.localizedDescription)
                delegate?.showError(error: errorRequest)
            }
        }
    }
}
