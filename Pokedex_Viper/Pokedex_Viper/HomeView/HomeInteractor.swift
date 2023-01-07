//
//  HomeInteractor.swift
//  Pokedex_Viper
//
//  Created by Uri on 3/1/23.
//  
//

import Foundation

final class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    var arrayPokemons = [Pokemon]()
    
    func interactorGetPokemons() {
        remoteDatamanager?.fetchPokemons()
    }

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    func remoteDataManagerCallBackData(with category: [Pokemon]) {
        for pokemon in category {
            let pokemonForView = Pokemon(id: pokemon.id, attack: pokemon.attack, name: pokemon.name, imageUrl: pokemon.imageUrl)
            self.arrayPokemons.append(pokemonForView)
        }
        presenter?.interactorPushDataToPresenter(receivedData: self.arrayPokemons)
    }
    
    
}
