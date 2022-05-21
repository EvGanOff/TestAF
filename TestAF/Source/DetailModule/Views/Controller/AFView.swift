//
//  AFView.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/14/22.
//

import UIKit

class AFView: UIView {
    let comicsDescription = AFTitleLabel(textAligment: .left, fontSize: 14)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(description: String) {
        self.init(frame: .zero)
        comicsDescription.text = description
    }
    
    private func configure() {
        addSubview(comicsDescription)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        configureDescriptionabel()
    }

    func configureDescriptionabel() {

        NSLayoutConstraint.activate([
            comicsDescription.topAnchor.constraint(equalTo: topAnchor, constant: Metric.padding),
            comicsDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.padding)
        ])
    }

    private struct Metric {
        static let padding: CGFloat = 12
    }
}
