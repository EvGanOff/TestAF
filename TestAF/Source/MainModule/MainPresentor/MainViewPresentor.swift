//
//  MainViewPresentor.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/20/22.
//

import Foundation

// output
protocol MainViewProtocol: AnyObject {
    func succses()
    func failure()
}

// input
protocol MainViewPresentorProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkManagerProtocol)
    func getMarvelCharacters()
    var  marvelHeroes: [MarvelCharacter]? { get set }
}

class MainViewPresentor: MainViewPresentorProtocol {

    weak var view: MainViewProtocol?
    var marvelHeroes: [MarvelCharacter]?
    let networkService: NetworkManagerProtocol!

    required init(view: MainViewProtocol, networkService: NetworkManagerProtocol) {
        self.view = view
        self.networkService = networkService

        getMarvelCharacters()
    }

    func getMarvelCharacters() {
        networkService.getHerousFromURL { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let charecters):
                    self.marvelHeroes = charecters
                    self.view?.succses()
                case .failure(let error):
                    self.view?.failure()
                    print("\(error.rawValue)")
                }
            }
        }
    }
}
