//
//  TableViewCell.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
  
    lazy var lineName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lineValue: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .systemGray5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lineValue.text = nil
        lineName.text = nil
    }
    
    private func setUp() {
        self.addSubview(lineName)
        self.addSubview(lineValue)
        
        NSLayoutConstraint.activate([lineName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
                                     lineName.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     lineValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
                                     lineValue.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}

