//
//  ProductService.swift
//  SupermarketList
//
//  Created by Premiersoft on 06/10/24.
//

import Foundation

final class ProductService {
    func getProduct(completion: @escaping(Result<[Product], ErrorRequest>) -> Void) {
        let products: [[String: Any]] = [
          [
            "id": 1,
            "name": "Arroz Branco 1kg",
            "image": "https://via.placeholder.com/150?text=Arroz+Branco",
            "category": "Cereais",
            "price": 5.99
          ],
          [
            "id": 2,
            "name": "Feijão Preto 1kg",
            "image": "https://via.placeholder.com/150?text=Feijao+Preto",
            "category": "Cereais",
            "price": 7.49
          ],
          [
            "id": 3,
            "name": "Macarrão Espaguete 500g",
            "image": "https://via.placeholder.com/150?text=Macarrao+Espaguete",
            "category": "Massas",
            "price": 3.99
          ],
          [
            "id": 4,
            "name": "Leite Integral 1L",
            "image": "https://via.placeholder.com/150?text=Leite+Integral",
            "category": "Laticínios",
            "price": 4.89
          ],
          [
            "id": 5,
            "name": "Iogurte Natural 170g",
            "image": "https://via.placeholder.com/150?text=Iogurte+Natural",
            "category": "Laticínios",
            "price": 2.99
          ],
          [
            "id": 6,
            "name": "Manteiga com Sal 200g",
            "image": "https://via.placeholder.com/150?text=Manteiga+com+Sal",
            "category": "Laticínios",
            "price": 9.49
          ],
          [
            "id": 7,
            "name": "Pão de Forma Integral 400g",
            "image": "https://via.placeholder.com/150?text=Pao+de+Forma+Integral",
            "category": "Padaria",
            "price": 6.39
          ],
          [
            "id": 8,
            "name": "Ovos Brancos 12 Unidades",
            "image": "https://via.placeholder.com/150?text=Ovos+Brancos",
            "category": "Ovos",
            "price": 10.79
          ],
          [
            "id": 9,
            "name": "Peito de Frango 1kg",
            "image": "https://via.placeholder.com/150?text=Peito+de+Frango",
            "category": "Carnes",
            "price": 22.90
          ],
          [
            "id": 10,
            "name": "Carne Moída Bovina 1kg",
            "image": "https://via.placeholder.com/150?text=Carne+Moida+Bovina",
            "category": "Carnes",
            "price": 34.99
          ],
          [
            "id": 11,
            "name": "Tomate 1kg",
            "image": "https://via.placeholder.com/150?text=Tomate",
            "category": "Hortifruti",
            "price": 8.79
          ],
          [
            "id": 12,
            "name": "Cenoura 1kg",
            "image": "https://via.placeholder.com/150?text=Cenoura",
            "category": "Hortifruti",
            "price": 6.49
          ],
          [
            "id": 13,
            "name": "Alface Crespa 1 Unidade",
            "image": "https://via.placeholder.com/150?text=Alface+Crespa",
            "category": "Hortifruti",
            "price": 2.99
          ],
          [
            "id": 14,
            "name": "Batata Inglesa 1kg",
            "image": "https://via.placeholder.com/150?text=Batata+Inglesa",
            "category": "Hortifruti",
            "price": 5.99
          ],
          [
            "id": 15,
            "name": "Café Torrado e Moído 500g",
            "image": "https://via.placeholder.com/150?text=Cafe+Torrado+e+Moido",
            "category": "Bebidas",
            "price": 18.79
          ],
          [
            "id": 16,
            "name": "Azeite de Oliva 500ml",
            "image": "https://via.placeholder.com/150?text=Azeite+de+Oliva",
            "category": "Condimentos",
            "price": 24.90
          ],
          [
            "id": 17,
            "name": "Sabão em Pó 1kg",
            "image": "https://via.placeholder.com/150?text=Sabao+em+Po",
            "category": "Limpeza",
            "price": 12.50
          ],
          [
            "id": 18,
            "name": "Amaciante de Roupas 2L",
            "image": "https://via.placeholder.com/150?text=Amaciante+de+Roupas",
            "category": "Limpeza",
            "price": 8.99
          ],
          [
            "id": 19,
            "name": "Desinfetante 500ml",
            "image": "https://via.placeholder.com/150?text=Desinfetante",
            "category": "Limpeza",
            "price": 4.79
          ],
          [
            "id": 20,
            "name": "Papel Higiênico 4 Rolos",
            "image": "https://via.placeholder.com/150?text=Papel+Higienico",
            "category": "Higiene",
            "price": 6.49
          ]
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            do {
                let json = try JSONSerialization.data(withJSONObject: products)
                let jsonDecoder = JSONDecoder()
                let products = try jsonDecoder.decode([Product].self, from: json)
                
                let boolArray = self.generateRandomBoolArray(count: 20, falsePercentage: 0.2)
                if boolArray.randomElement() ?? false {
                    completion(.success(products))
                } else {
                    completion(.failure(ErrorRequest(message: "Por favor, tenha paciência e tente novamente later!")))
                }
            } catch {
                completion(.failure(ErrorRequest(message: error.localizedDescription)))
            }
        }
    }
    
    func generateRandomBoolArray(count: Int, falsePercentage: Double) -> [Bool] {
        var boolArray: [Bool] = []
        
        for _ in 0..<count {
            let randomValue = Double.random(in: 0...1)
            let result = randomValue >= falsePercentage
            boolArray.append(result)
        }
        return boolArray
    }
}

struct ErrorRequest: Error {
    let message: String
}

struct Product: Codable {
    let id: Int
    let name: String
    let image: String
    let category: String
}
