//
//  HomeWireFrame.swift
//  Pokedex_Viper
//  https://youtu.be/Uokamj2WtxU
//  Created by Uri on 3/1/23.
//  
//

import Foundation
import UIKit

final class HomeWireFrame: HomeWireFrameProtocol {
    
    static func createHomeModule() -> UINavigationController {
        let view = HomeView()
        let navController = UINavigationController(rootViewController: view)
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
        let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
        let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
        let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return navController
    }
    
}
