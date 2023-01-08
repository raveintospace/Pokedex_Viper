//
//  HomeView.swift
//  Pokedex_Viper
//
//  Created by Uri on 3/1/23.
//  
//

import Foundation
import UIKit

final class HomeView: UIViewController {

    // MARK: - Properties
    var presenter: HomePresenterProtocol?
    
    var pokemonSearchTextField = UITextField()
    var pokemonTableView = UITableView()
    var safeArea: UILayoutGuide!
    let navigationBarAppearance = UINavigationBarAppearance()
    
    var arrayViewPokemons = [Pokemon]()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: - Extensions

extension HomeView: HomeViewProtocol {
       
    func setupHomeView() {
        safeArea = view.layoutMarginsGuide
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        pokemonTableView.register(PokemonCell.self, forCellReuseIdentifier: "cellId")
        self.navigationItem.title = "Pokedex Viper"
        setupNavigationBar()
        setupPokemonSearchTextField()
        setupPokemonTableView()
    }
    
    func setupNavigationBar() {
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.backgroundColor = .black
        
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
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
        
        self.pokemonTableView.rowHeight = 75
    }
    
    func presenterPushDataToView(receivedData: [Pokemon]) {
        arrayViewPokemons = receivedData
        DispatchQueue.main.async {
            self.pokemonTableView.reloadData()
        }
    }
}

// MARK: - PokemonTableView

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayViewPokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let pokemon = arrayViewPokemons[indexPath.row]
        
        guard let pokemonCell = cell as? PokemonCell else { return cell }
        pokemonCell.nameLabel.text = pokemon.name.capitalized
        pokemonCell.attackLabel.text = "Attack: \(pokemon.attack)"
        pokemonCell.defenseLabel.text = "Defense: \(pokemon.defense)"
        pokemonCell.idLabel.text = String(pokemon.id)
        
        if let url = URL(string: pokemon.imageUrl) {
            pokemonCell.imageIV.loadImage(from: url)
        }
        
        return cell
    }
}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = arrayViewPokemons[indexPath.row]
        presenter?.showPokemonDetailView(with: pokemon)
    }
}
