//
//  DetailProtocols.swift
//  Pokedex_Viper
//
//  Created by Uri on 7/1/23.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    func setupDetailView()
    func showDataInDetailVC(data: Pokemon)
}

protocol DetailWireFrameProtocol {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(with data: Pokemon) -> UIViewController
}

protocol DetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    var dataPokemonReceived: Pokemon? { get set }
    
    func viewDidLoad()
}
