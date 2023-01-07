//
//  PokemonEntity.swift
//  Pokedex_Viper
//
//  Created by Uri on 7/1/23.
//

import Foundation

//struct PokemonEntity: Decodable {
//    let pokemon: [Pokemon]
//}

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let name: String
    let imageUrl: String
}
