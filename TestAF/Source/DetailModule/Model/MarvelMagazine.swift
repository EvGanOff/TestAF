//
//  MarvelMagazine.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/14/22.
//

import Foundation
import FileProvider

struct MarvelComics: Codable, Hashable {
    let items: [MarvelMagazine]
}

struct MarvelMagazine: Codable, Hashable {
    let name: String
}
