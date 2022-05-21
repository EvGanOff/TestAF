//
//  MagazineVC.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/14/22.
//

import UIKit

class MagazineVC: UIViewController {

    let magazine = AFView(frame: .zero)
    var name = String()
    var comics = [MarvelMagazine]()

    var presenter: DetailViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getComics()

        view.addSubview(magazine)
        view.backgroundColor = .systemBackground
    }

    init(with name: String, and comics: MarvelComics) {
        super.init(nibName: nil, bundle: nil)
        self.name = name
        self.comics = comics.items
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
}

extension MagazineVC: DetailViewProtocol {
    func setComics(comic: [MarvelMagazine]) {
        var comicsName = "Комиксы с участием " + name + ":\n"

        comic.forEach { comics in
            comicsName += "\n" + comics.name
        }

        magazine.comicsDescription.text = comicsName
    }
}
