//
//  TableViewCellButton.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

class TableViewCellButton: UITableViewCell {
    
    lazy var viewLaunchesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.0971372202, green: 0.1021228805, blue: 0.1020363793, alpha: 1)
        button.tintColor = .systemGray5
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setTitle("Посмотреть запуски", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.addSubview(viewLaunchesButton)
        
        NSLayoutConstraint.activate([viewLaunchesButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                                     viewLaunchesButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
                                     viewLaunchesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
                                     viewLaunchesButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                                     viewLaunchesButton.heightAnchor.constraint(equalToConstant: 50)])
    }
   
}
