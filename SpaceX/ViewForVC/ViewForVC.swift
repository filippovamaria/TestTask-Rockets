//
//  ViewForVC.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

protocol ViewForVCDelegate: AnyObject {
    func didTapSettingsButton(view: ViewForVC)
}

class ViewForVC: UIView {
    
    
    weak var delegate: ViewForVCDelegate?
    
    private lazy var rocketImage: UIImageView = {
        let rocketImage = UIImageView()
        rocketImage.backgroundColor = .gray
        rocketImage.translatesAutoresizingMaskIntoConstraints = false
        return rocketImage
    }()
    
    private lazy var rocketName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .regular)
        label.textColor = .systemGray5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var settingsButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "gearshape")
        image.tintColor = .systemGray5
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var stackView: UIView = {
        let stackView = UIView()
        stackView.backgroundColor = .black
        stackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        stackView.layer.cornerRadius = 40
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var tapSettingsButton = UITapGestureRecognizer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.addSubview(rocketImage)
        self.addSubview(stackView)
        stackView.addSubview(settingsButton)
        stackView.addSubview(rocketName)
        
        NSLayoutConstraint.activate([rocketImage.topAnchor.constraint(equalTo: self.topAnchor),
                                     rocketImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     rocketImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     rocketImage.heightAnchor.constraint(equalToConstant: 400)
                                    ])
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: rocketImage.bottomAnchor, constant: -100),
                                     stackView.trailingAnchor.constraint(equalTo: rocketImage.trailingAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: rocketImage.leadingAnchor),
                                     stackView.heightAnchor.constraint(equalToConstant: 100)])
        
        NSLayoutConstraint.activate([settingsButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10),
                                     settingsButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30),
                                     settingsButton.widthAnchor.constraint(equalToConstant: 35),
                                     settingsButton.heightAnchor.constraint(equalToConstant: 35)])
        
        NSLayoutConstraint.activate([rocketName.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10),
                                     rocketName.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30)])
    }
    
    private func setUpGesture() {
        tapSettingsButton.addTarget(self, action: #selector(didTap))
        settingsButton.isUserInteractionEnabled = true
        settingsButton.addGestureRecognizer(tapSettingsButton)
        print("Начало")
    }
    
    @objc private func didTap() {
        print("a")
//        guard gestureRecognizer === tapSettingsButton else { return }
        delegate?.didTapSettingsButton(view: self)
        print("delegate")
    }
}


extension ViewForVC {
    func setUpVC(array: Model.RocketModel) {
        let url = URL(string: array.flickr_images?.randomElement() ?? "")
        if let data = try? Data(contentsOf: url!) {
            rocketImage.image = UIImage(data: data)
        }
        
        guard let arrayName = array.name else { return }
        rocketName.text = arrayName
    }
    
    func createArrayForZeroSection(array: Model.RocketModel) -> [String] {
        let valueForLine0 = array.first_flightString
        
        let valueForLine1 = array.country ?? ""
        
        let costDivided = (array.cost_per_launch ?? 0) / 1000000
        let valueForLine2 = "$" + String(costDivided) + "млн"
        
        return [valueForLine0, valueForLine1, valueForLine2]
    }
    
    func createArrayForFirstSection(array: Model.RocketModel) -> [String] {
        let valueForLine0 = String(array.first_stage?.engines ?? 0)

        let valueForLine1 = String(array.first_stage?.fuel_amount_tons ?? 0)
        
        let valueForLine2 = String(array.first_stage?.burn_time_sec ?? 0)
        
        return [valueForLine0, valueForLine1, valueForLine2]
    }
    
    func createArrayForSecondSection(array: Model.RocketModel) -> [String] {
        let valueForLine0 = String(array.second_stage?.engines ?? 0)

        let valueForLine1 = String(array.second_stage?.fuel_amount_tons ?? 0)
        
        let valueForLine2 = String(array.second_stage?.burn_time_sec ?? 0)
        
        return [valueForLine0, valueForLine1, valueForLine2]
    }
}

