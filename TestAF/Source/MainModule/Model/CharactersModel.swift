//
//  CharactersModel.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/13/22.
//

import Foundation
import FileProvider

struct MarvelResponse: Codable, Hashable {
    let code: Int
    let data: MarvelCharacters
}

struct MarvelCharacters: Codable, Hashable {
    let results: [MarvelCharacter]
}

struct MarvelCharacter: Codable, Hashable {
    let name: String
    let comics: MarvelComics
}

