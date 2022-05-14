//
//  CaracterVC.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 4/25/22.
//

import UIKit

protocol NetworkManagerProtocol {
    func getHerousFromURL(completion: @escaping (Result<[MarvelCharacter], AFErrors>) -> ())
}

class CaracterVC: UIViewController {

    // MARK: - Properties -

    private lazy var marvelHeroes = [MarvelCharacter]()
    private var networkDelegat: NetworkManagerProtocol? = NetworkManager()
    let tableView = UITableView()

    // MARK: - ViewController lifecycle -

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchMarvelCharacters()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }

    // MARK: - Configure -

    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Marvel"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureTableView() {
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(MarvelHerousCells.self, forCellReuseIdentifier: MarvelHerousCells.reuseID)
        tableView.rowHeight = 80
    }

    private func fetchMarvelCharacters() {
        networkDelegat?.getHerousFromURL(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let characters):
                print("\(characters.count)")
                self.marvelHeroes = characters
                self.tableView.reloadData()
            case .failure(let error):
                print("\(error.rawValue)")
            }
        })
    }
}

// MARK: - TableViewDataSource -

extension CaracterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marvelHeroes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MarvelHerousCells.reuseID) as? MarvelHerousCells else {
            let cell = MarvelHerousCells(style: .default, reuseIdentifier: MarvelHerousCells.reuseID)
            return cell
        }

        cell.herousName.text = marvelHeroes[indexPath.row].name

        return cell
    }
}

// MARK: - UITableViewDelegate -

extension CaracterVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let name = marvelHeroes[indexPath.row].name
        let comics = marvelHeroes[indexPath.row].comics

        let newViewController = MagazineVC(with: name, and: comics)
        self.present(newViewController, animated: true)
    }
}
