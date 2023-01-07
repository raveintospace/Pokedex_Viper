//
//  HomePresenter.swift
//  Pokedex_Viper
//
//  Created by Uri on 3/1/23.
//  
//

import Foundation

final class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
   
    func viewDidLoad() {
        interactor?.interactorGetPokemons()
        view?.setup()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func interactorPushDataToPresenter(receivedData: [Pokemon]) {
        view?.presenterPushDataToView(receivedData: receivedData)
    }
}
