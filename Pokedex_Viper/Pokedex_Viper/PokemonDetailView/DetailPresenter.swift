//
//  DetailPresenter.swift
//  Pokedex_Viper
//
//  Created by Uri on 7/1/23.
//  
//

import Foundation

final class DetailPresenter: DetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var dataPokemonReceived: Pokemon?
    
    func viewDidLoad() {
        if let dataPokemonReceived = dataPokemonReceived {
            view?.setupDetailView()
            view?.showDataInDetailVC(data: dataPokemonReceived)
        }
    }
}

