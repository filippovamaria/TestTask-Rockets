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
    
    private lazy var launchName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textColor = .systemGray5
        label.text = "Name!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var launchDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .systemGray2
        label.text = "Date!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var launchIcon: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "rocketSuc")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        launchView.addSubview(launchName)
        launchView.addSubview(launchDate)
        launchView.addSubview(launchIcon)
        
        NSLayoutConstraint.activate([launchView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                                     launchView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
                                     launchView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
                                     launchView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                                     launchView.heightAnchor.constraint(equalToConstant: 100)])
        
        NSLayoutConstraint.activate([launchName.topAnchor.constraint(equalTo: launchView.topAnchor, constant: 20),
                                     launchName.leadingAnchor.constraint(equalTo: launchView.leadingAnchor, constant: 20)])

        NSLayoutConstraint.activate([launchDate.topAnchor.constraint(equalTo: launchName.bottomAnchor, constant: 5),
                                     launchDate.leadingAnchor.constraint(equalTo: launchView.leadingAnchor, constant: 20)])

        NSLayoutConstraint.activate([launchIcon.centerYAnchor.constraint(equalTo: launchView.centerYAnchor),
                                     launchIcon.trailingAnchor.constraint(equalTo: launchView.trailingAnchor, constant: -30),
                                     launchIcon.heightAnchor.constraint(equalToConstant: 40),
                                     launchIcon.widthAnchor.constraint(equalToConstant: 40)])        
    }
}

