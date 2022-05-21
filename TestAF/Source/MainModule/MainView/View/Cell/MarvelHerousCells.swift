//
//  MarvelHerousCells.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/13/22.
//

import UIKit

class MarvelHerousCells: UITableViewCell {
    
    static let reuseID = "MarvelHerousCells"

    // MARK: - Properties -
    
    let herousName = AFTitleLabel(textAligment: .left, fontSize: 20)

    // MARK: - Init -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - SetupHierarchy -

    private func setupHierarchy() {
        contentView.addSubview(herousName)
    }

    // MARK: - Configure -

    private func configure() {
        herousName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            herousName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            herousName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            herousName.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Matrics.padding),
            herousName.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Matrics.padding)
        ])
    }

    // MARK: - Matrics -

    private struct Matrics {
        static let padding: CGFloat = 12
    }
}
