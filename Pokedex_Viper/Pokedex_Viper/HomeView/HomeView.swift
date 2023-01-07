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
    var pokemonSearchTextField = UITextField()
    var pokemonTableView = UITableView()
    var safeArea: UILayoutGuide!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
       
    func setup() {
        safeArea = view.layoutMarginsGuide
        pokemonTableView.dataSource = self
        // pokemonTableView.delegate = self
        pokemonTableView.register(PokemonCell.self, forCellReuseIdentifier: "cellId")
        setupPokemonSearchTextField()
        setupPokemonTableView()
        self.navigationItem.title = "Pokedex Viper"
    }
    
    func setupPokemonSearchTextField() {
        view.addSubview(pokemonSearchTextField)
        
        pokemonSearchTextField.translatesAutoresizingMaskIntoConstraints = false
        pokemonSearchTextField.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        pokemonSearchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pokemonSearchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pokemonSearchTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pokemonSearchTextField.placeholder = "Search a Pokemon"
        pokemonSearchTextField.backgroundColor = .white
        pokemonSearchTextField.textAlignment = .center
        pokemonSearchTextField.borderStyle = .roundedRect
    }
    
    func setupPokemonTableView() {
        view.addSubview(pokemonTableView)
        
        pokemonTableView.translatesAutoresizingMaskIntoConstraints = false
        pokemonTableView.topAnchor.constraint(equalTo: pokemonSearchTextField.bottomAnchor, constant: 2).isActive = true
        pokemonTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pokemonTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pokemonTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        guard let pokemonCell = cell as? PokemonCell else { return cell }
        pokemonCell.nameLabel.text = "Pikachu"
        pokemonCell.attackLabel.text = "Fire"
        pokemonCell.idLabel.text = "10"
        return cell
    }
    
}
