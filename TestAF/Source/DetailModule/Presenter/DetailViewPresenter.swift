//
//  DetailViewPresenter.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/20/22.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComics(comic: [MarvelMagazine])
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkManager: NetworkManagerProtocol, comics: [MarvelMagazine])
    func getComics()
}

class DeteilViewPresentor: DetailViewPresenterProtocol {

    weak var view: DetailViewProtocol?
    let magazine = AFView(frame: .zero)
    var name = String()
    var comics = [MarvelMagazine]()
    var networkManager: NetworkManagerProtocol!

    required init(view: DetailViewProtocol, networkManager: NetworkManagerProtocol, comics: [MarvelMagazine]) {
        self.view = view
        self.networkManager = networkManager
        self.comics = comics
    }

    func getComics() {
        view?.setComics(comic: comics)
    }
}
