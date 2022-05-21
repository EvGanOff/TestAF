//
//  CaracterVC.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 4/25/22.
//

import UIKit

class CaracterVC: UIViewController {

    // MARK: - Properties -

    var presenter: MainViewPresentorProtocol?
    let tableView = UITableView()

    // MARK: - ViewController lifecycle -

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
}

// MARK: - MainViewProtocol -

extension CaracterVC: MainViewProtocol {
    func succses() {
        tableView.reloadData()
    }

    func failure() {
        // аллерт
    }
}

// MARK: - TableViewDataSource -

extension CaracterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.marvelHeroes?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MarvelHerousCells.reuseID) as? MarvelHerousCells else {
            let cell = MarvelHerousCells(style: .default, reuseIdentifier: MarvelHerousCells.reuseID)
            return cell
        }

        cell.herousName.text = presenter?.marvelHeroes?[indexPath.row].name

        return cell
    }
}

// MARK: - UITableViewDelegate -

extension CaracterVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = presenter else { return /* Вернуть алерт */}
        
        tableView.deselectRow(at: indexPath, animated: true)
        let charactersName = presenter.marvelHeroes?[indexPath.row].name
        let comics = presenter.marvelHeroes?[indexPath.row].comics.items

        guard let magazines = comics, let name = charactersName else { return }

        let newViewController = MainScreenBuilder.createDetailModul(name: name, comics: magazines)
        self.present(newViewController, animated: true)
    }
}
