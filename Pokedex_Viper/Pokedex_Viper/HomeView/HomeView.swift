//
//  HomeView.swift
//  Pokedex_Viper
//
//  Created by Uri on 3/1/23.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        view.backgroundColor = .orange
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}
