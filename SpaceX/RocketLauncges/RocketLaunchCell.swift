//
//  RocketLaunchCell.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

class RocketLaunchCell: UITableViewCell {
    
    private lazy var launchView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.07843136042, green: 0.07843136042, blue: 0.07843136042, alpha: 1)
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var launchName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemGray5
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var launchDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray2
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var launchIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var launchStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.addSubview(launchView)
        launchView.addSubview(launchIcon)
        launchView.addSubview(launchStack)
        launchStack.addArrangedSubview(launchName)
        launchStack.addArrangedSubview(launchDate)
        
        NSLayoutConstraint.activate([launchView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                                     launchView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
                                     launchView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
                                     launchView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                                     launchView.heightAnchor.constraint(equalToConstant: 100)])

        NSLayoutConstraint.activate([launchIcon.centerYAnchor.constraint(equalTo: launchView.centerYAnchor),
                                     launchIcon.trailingAnchor.constraint(equalTo: launchView.trailingAnchor, constant: -30),
                                     launchIcon.heightAnchor.constraint(equalToConstant: 40),
                                     launchIcon.widthAnchor.constraint(equalToConstant: 40)])
        
        NSLayoutConstraint.activate([launchStack.centerYAnchor.constraint(equalTo: launchView.centerYAnchor),
                                     launchStack.leadingAnchor.constraint(equalTo: launchView.leadingAnchor, constant: 20),
                                     launchStack.trailingAnchor.constraint(equalTo: launchView.trailingAnchor, constant: -80)])
    }
}

