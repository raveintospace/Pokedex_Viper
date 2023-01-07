//
//  DetailView.swift
//  Pokedex_Viper
//
//  Created by Uri on 7/1/23.
//  
//

import Foundation
import UIKit

final class DetailView: UIViewController {

    // MARK: - Properties
    var presenter: DetailPresenterProtocol?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension DetailView: DetailViewProtocol {
}
