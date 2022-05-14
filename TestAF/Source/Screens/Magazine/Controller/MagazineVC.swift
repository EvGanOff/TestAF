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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(magazine)
        view.backgroundColor = .systemBackground
        configure()
    }

    init(with name: String, and comics: MarvelComics) {
        super.init(nibName: nil, bundle: nil)
        self.name = name
        self.comics = comics.items
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        var comicsName = "Комиксы с участием " + name + ":\n"
        comics.forEach { comics in
            comicsName += "\n" + comics.name
        }
        magazine.comicsDescription.text = comicsName
        
    }
}
