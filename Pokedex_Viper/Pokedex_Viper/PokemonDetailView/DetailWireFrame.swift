//
//  DetailWireFrame.swift
//  Pokedex_Viper
//
//  Created by Uri on 7/1/23.
//  
//

import Foundation
import UIKit

final class DetailWireFrame: DetailWireFrameProtocol {
    
    static func createDetailModule(with data: Pokemon) -> UIViewController {
        let view = DetailView()
        let presenter: DetailPresenterProtocol = DetailPresenter()
        let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.dataPokemonReceived = data
        
        return view
    }
}
