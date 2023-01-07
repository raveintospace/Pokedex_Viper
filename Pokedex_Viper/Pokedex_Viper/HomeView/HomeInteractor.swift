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
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    func interactorGetPokemons() {
        remoteDatamanager?.fetchPokemons()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    func remoteDataManagerCallBackData(with data: [Pokemon]) {
        presenter?.interactorPushDataToPresenter(receivedData: data)
    }
}
