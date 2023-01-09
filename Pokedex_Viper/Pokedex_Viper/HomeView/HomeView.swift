//
//  HomeView.swift
//  Pokedex_Viper
//  https://www.youtube.com/playlist?list=PLaXVvUVtO7VtetqTVKMPU4kD2Xtwz00YT
//  Created by Uri on 3/1/23.
//  
//

import Foundation
import UIKit

final class HomeView: UIViewController {

    // MARK: - Properties
    var presenter: HomePresenterProtocol?
    
    var pokemonSearchBar = UISearchBar()
    var pokemonTableView = UITableView()
    var safeArea: UILayoutGuide!
    let navigationBarAppearance = UINavigationBarAppearance()
    
    var arrayViewPokemons = [Pokemon]()
    var filteredPokemons = [Pokemon]()

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
        pokemonSearchBar.delegate = self
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        pokemonTableView.register(PokemonCell.self, forCellReuseIdentifier: "cellId")
        self.navigationItem.title = "Pokedex Viper"
        setupNavigationBar()
        setupPokemonSearchBar()
        setupPokemonTableView()
        setupHomeViewColorsForLightMode()
    }
    
    func setupNavigationBar() {
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.backgroundColor = .black
        
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
    }
    
    func setupPokemonSearchBar() {
        view.addSubview(pokemonSearchBar)
        
        pokemonSearchBar.translatesAutoresizingMaskIntoConstraints = false
        pokemonSearchBar.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        pokemonSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pokemonSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pokemonSearchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pokemonSearchBar.placeholder = "Search a Pokemon"
        //pokemonSearchBar.backgroundColor = .white
    }
    
    func setupPokemonTableView() {
        view.addSubview(pokemonTableView)
        
        pokemonTableView.translatesAutoresizingMaskIntoConstraints = false
        pokemonTableView.topAnchor.constraint(equalTo: pokemonSearchBar.bottomAnchor, constant: 2).isActive = true
        pokemonTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pokemonTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pokemonTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.pokemonTableView.rowHeight = 75
    }
    
    // MARK: - View light Mode

        private func setupHomeViewColorsForLightMode() {
            
            if #available(iOS 12.0, *) {
                let isLightMode = traitCollection.userInterfaceStyle == .light
                
                view.backgroundColor = isLightMode ? .white : .black
            }
        }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        setupHomeViewColorsForLightMode()
    }
    
    // MARK: - View data configuration
    
    func presenterPushDataToView(receivedData: [Pokemon]) {
        arrayViewPokemons = receivedData
        filteredPokemons = arrayViewPokemons
        DispatchQueue.main.async {
            self.pokemonTableView.reloadData()
        }
    }
}

// MARK: - PokemonTableView

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let pokemon = filteredPokemons[indexPath.row]
        
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
        let pokemon = filteredPokemons[indexPath.row]
        presenter?.showPokemonDetailView(with: pokemon)
    }
}

// MARK: - SearchBar

extension HomeView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredPokemons = []   // empty the array from previous searches
        
        if searchText == "" {
            filteredPokemons = arrayViewPokemons
        } else {
            for pokemon in arrayViewPokemons {
                if pokemon.name.lowercased().contains(searchText.lowercased()) {
                    filteredPokemons.append(pokemon)
                }
            }
        }
        self.pokemonTableView.reloadData()
    }
}



// to do
// dark mode
