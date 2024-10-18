//
//  ViewController.swift
//  SupermarketList
//
//  Created by Premiersoft on 28/09/24.
//

import SwiftUI
import DesignSystem

class TabBarController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: ViewController())
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .lightPurple
        navigationController.navigationBar.standardAppearance = navBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        setViewControllers([navigationController, SearchViewController()], animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SearchViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        self.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), tag: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    private let viewModel = ProductViewModel()
    private let mainView = HomeView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
        self.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getProduct()
        teste()
    }
}

extension ViewController: ProductViewModelDelegate {
    func reloadData() {
        mainView.reloadData(data: viewModel.product)
    }
    
    func showError(error: ErrorRequest) {
        let alert = UIAlertController(title: "Ocorreu um erro!", message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok!", style: .cancel, handler: { _ in
            alert.dismiss(animated: false)
            alert.present(alert, animated: false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                alert.dismiss(animated: true)
            }
        }))
        present(alert, animated: true)
    }
    
    func getStuffs() async throws -> Data {
        if false {
            return Data()
        } else {
            throw ErrorRequest(message: "")
        }
    }
    
    func teste() {
        Task {
            do {
                let result = try await getStuffs()
                printContent(result)
            } catch is ErrorRequest {
                reloadView()
            } catch {
                reloadView()
            }
        }
    }
    
    func reloadView() {
        DispatchQueue.main.async {
            self.mainView.reloadData(data: [])
        }
    }
}

enum HomeBannerType: CaseIterable {
    case hortifruti
    case butchery
    case drinks
    
    var backgroudColor: UIColor {
        return .lightPurple
    }
    
    var title: String {
        switch self {
        case .hortifruti:
            return "Hortifruti"
        case .butchery:
            return "Açougue"
        case .drinks:
            return "Bebidas"
        }
    }
}

final class HomeView: UIView {
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeBannerTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var products = [Product]()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData(data: [Product]) {
        self.products = data
        tableView.reloadData()
    }
    
    private func setupView() {
        addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        }
        
        return HomeBannerType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = PurchaseCollectionView()
            cell.setup(data: products)
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeBannerTableViewCell
        let type = HomeBannerType.allCases[indexPath.row]
        cell?.setup(type: type)
        return cell ?? UITableViewCell()
    }
}
