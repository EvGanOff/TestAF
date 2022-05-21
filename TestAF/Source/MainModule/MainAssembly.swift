//
//  MainAssembly.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/20/22.
//

import Foundation
import UIKit

protocol MainAssembly {
    static func createMainModul() -> UIViewController
    static func createDetailModul(name: String, comics: [MarvelMagazine]) -> UIViewController
}

class MainScreenBuilder: MainAssembly {
    static func createMainModul() -> UIViewController {
        let view = CaracterVC()
        let networkManager = NetworkManager()
        let presenter = MainViewPresentor(view: view, networkService: networkManager )
        view.presenter = presenter

        return view
    }

    static func createDetailModul(name: String, comics: [MarvelMagazine]) -> UIViewController {
        let view = MagazineVC()
        let networkManager = NetworkManager()
        let presenter = DeteilViewPresentor(view: view, networkManager: networkManager, comics: comics)
        view.presenter = presenter

        return view
    }
}
