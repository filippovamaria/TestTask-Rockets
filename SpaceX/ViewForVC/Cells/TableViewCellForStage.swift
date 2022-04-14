//
//  TableViewCellForStage.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

class TableViewCellForStage: UITableViewCell {

    lazy var lineNameForStage: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lineValueForStage: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .systemGray5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lineMeasureForStage: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lineValueForStage.text = nil
        lineNameForStage.text = nil
        lineMeasureForStage.text = nil
    }
    
    private func setUp() {
        self.addSubview(lineNameForStage)
        self.addSubview(stack)
        stack.addArrangedSubview(lineValueForStage)
        stack.addArrangedSubview(lineMeasureForStage)
     
        
        NSLayoutConstraint.activate([lineNameForStage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
                                     lineNameForStage.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        
        NSLayoutConstraint.activate([stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
                                    stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}

