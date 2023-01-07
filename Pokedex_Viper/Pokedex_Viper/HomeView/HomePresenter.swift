//
//  HomePresenter.swift
//  Pokedex_Viper
//
//  Created by Uri on 3/1/23.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
   
    func viewDidLoad() {
        view?.setup()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
}
