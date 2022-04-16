//
//  SettingVC.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

class SettingVC: UIViewController {

    private lazy var vcName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemGray3
        label.text = "Настройки"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.tintColor = .systemGray5
        button.setTitle("Закрыть", for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemGray3
        label.text = "Высота"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControlHeight: UISegmentedControl = {
        let segmentedControlHeight = UISegmentedControl()
        segmentedControlHeight.selectedSegmentTintColor = .white
        segmentedControlHeight.backgroundColor = #colorLiteral(red: 0.07360426337, green: 0.07859290391, blue: 0.0785067156, alpha: 1)
        segmentedControlHeight.insertSegment(withTitle: "m", at: 0, animated: false)
        segmentedControlHeight.insertSegment(withTitle: "ft", at: 1, animated: false)
        segmentedControlHeight.selectedSegmentIndex = 0
        segmentedControlHeight.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControlHeight
    }()
    
    private lazy var diameterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemGray3
        label.text = "Диаметр"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControlDiameter: UISegmentedControl = {
        let segmentedControlDiameter = UISegmentedControl()
        segmentedControlDiameter.selectedSegmentTintColor = .white
        segmentedControlDiameter.backgroundColor = #colorLiteral(red: 0.07360426337, green: 0.07859290391, blue: 0.0785067156, alpha: 1)
        segmentedControlDiameter.insertSegment(withTitle: "m", at: 0, animated: false)
        segmentedControlDiameter.insertSegment(withTitle: "ft", at: 1, animated: false)
        segmentedControlDiameter.selectedSegmentIndex = 0
        segmentedControlDiameter.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControlDiameter
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemGray3
        label.text = "Масса"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControlWeight: UISegmentedControl = {
        let segmentedControlWeight = UISegmentedControl()
        segmentedControlWeight.selectedSegmentTintColor = .white
        segmentedControlWeight.backgroundColor = #colorLiteral(red: 0.07360426337, green: 0.07859290391, blue: 0.0785067156, alpha: 1)
        segmentedControlWeight.insertSegment(withTitle: "kg", at: 0, animated: false)
        segmentedControlWeight.insertSegment(withTitle: "lb", at: 1, animated: false)
        segmentedControlWeight.selectedSegmentIndex = 0
        segmentedControlWeight.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControlWeight
    }()
    
    private lazy var payloadLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemGray3
        label.text = "Полезная нагрузка"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControlPayload: UISegmentedControl = {
        let segmentedControlPayload = UISegmentedControl()
        segmentedControlPayload.selectedSegmentTintColor = .white
        segmentedControlPayload.backgroundColor = #colorLiteral(red: 0.07360426337, green: 0.07859290391, blue: 0.0785067156, alpha: 1)
        segmentedControlPayload.insertSegment(withTitle: "kg", at: 0, animated: false)
        segmentedControlPayload.insertSegment(withTitle: "lb", at: 1, animated: false)
        segmentedControlPayload.selectedSegmentIndex = 0
        segmentedControlPayload.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControlPayload
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUp()
    }
    
    private func setUp() {
        view.addSubview(vcName)
        view.addSubview(closeButton)
        view.addSubview(segmentedControlHeight)
        view.addSubview(heightLabel)
        view.addSubview(segmentedControlDiameter)
        view.addSubview(diameterLabel)
        view.addSubview(segmentedControlWeight)
        view.addSubview(weightLabel)
        view.addSubview(segmentedControlPayload)
        view.addSubview(payloadLabel)
        
        NSLayoutConstraint.activate([vcName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     vcName.topAnchor.constraint(equalTo: view.topAnchor, constant: 25)])
        
        NSLayoutConstraint.activate([closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                                     closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)])
        
        NSLayoutConstraint.activate([segmentedControlHeight.topAnchor.constraint(equalTo: closeButton.topAnchor, constant: 120),
                                     segmentedControlHeight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     segmentedControlHeight.heightAnchor.constraint(equalToConstant: 50),
                                     segmentedControlHeight.widthAnchor.constraint(equalToConstant: 130)])
        
        NSLayoutConstraint.activate([heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     heightLabel.centerYAnchor.constraint(equalTo: segmentedControlHeight.centerYAnchor)])
        
        NSLayoutConstraint.activate([segmentedControlDiameter.topAnchor.constraint(equalTo: segmentedControlHeight.bottomAnchor, constant: 30),
                                     segmentedControlDiameter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     segmentedControlDiameter.heightAnchor.constraint(equalToConstant: 50),
                                     segmentedControlDiameter.widthAnchor.constraint(equalToConstant: 130)])
        
        NSLayoutConstraint.activate([diameterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     diameterLabel.centerYAnchor.constraint(equalTo: segmentedControlDiameter.centerYAnchor)])
        
        NSLayoutConstraint.activate([segmentedControlWeight.topAnchor.constraint(equalTo: segmentedControlDiameter.bottomAnchor, constant: 30),
                                     segmentedControlWeight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     segmentedControlWeight.heightAnchor.constraint(equalToConstant: 50),
                                     segmentedControlWeight.widthAnchor.constraint(equalToConstant: 130)])
        
        NSLayoutConstraint.activate([weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     weightLabel.centerYAnchor.constraint(equalTo: segmentedControlWeight.centerYAnchor)])
        
        NSLayoutConstraint.activate([segmentedControlPayload.topAnchor.constraint(equalTo: segmentedControlWeight.bottomAnchor, constant: 30),
                                     segmentedControlPayload.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     segmentedControlPayload.heightAnchor.constraint(equalToConstant: 50),
                                     segmentedControlPayload.widthAnchor.constraint(equalToConstant: 130)])
        
        NSLayoutConstraint.activate([payloadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     payloadLabel.centerYAnchor.constraint(equalTo: segmentedControlPayload.centerYAnchor)])
    }
    
    @objc private func didTapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

