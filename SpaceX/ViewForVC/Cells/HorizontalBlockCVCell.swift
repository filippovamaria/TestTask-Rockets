//
//  HorizontalBlockCVCell.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

class HorizontalBlockCVCell: UICollectionViewCell {
    
    lazy var parameterValue: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray5
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var parameter: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.101960592, green: 0.1019609794, blue: 0.1105465367, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 3
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        parameter.text = nil
        parameterValue.text = nil
    }
    
    private func setUpCell() {
        self.addSubview(view)
        view.addSubview(stack)
        stack.addArrangedSubview(parameterValue)
        stack.addArrangedSubview(parameter)
        
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: self.topAnchor),
                                     view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     view.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        
        NSLayoutConstraint.activate([stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     stack.leadingAnchor.constraint(equalTo: view.leadingAnchor)])
    }
}
