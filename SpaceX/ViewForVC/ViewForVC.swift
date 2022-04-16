//
//  ViewForVC.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

protocol ViewForVCDelegate: AnyObject {
    func didTapSettingsButton()
    func didTapLaunchButton()
}

class ViewForVC: UIView {
    
    weak var delegate: ViewForVCDelegate?
    private var tapSettingsButton = UITapGestureRecognizer()
    var valuesForZeroSection: [String] = []
    var valuesForFirstSection: [String] = []
    var valuesForSecondSection: [String] = []
    var parametersValuesView: [String] = []
    
    private lazy var rocketImage: UIImageView = {
        let rocketImage = UIImageView()
        rocketImage.backgroundColor = .black
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
        image.alpha = 0
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
    
     lazy var tableView: UITableView = {
         let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(HorizontalBlockCell.self, forCellReuseIdentifier: "HorizontalBlockCell")
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.register(TableViewCellForStage.self, forCellReuseIdentifier: "TableViewCellForStage")
        tableView.register(TableViewCellButton.self, forCellReuseIdentifier: "TableViewCellButton")
        tableView.insetsContentViewsToSafeArea = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
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
        self.addSubview(tableView)
        stackView.addSubview(settingsButton)
        stackView.addSubview(rocketName)
        
        NSLayoutConstraint.activate([rocketImage.topAnchor.constraint(equalTo: self.topAnchor),
                                     rocketImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     rocketImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     rocketImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(UIScreen.main.bounds.height / 20) * 10)])
        
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
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
                                    tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                    tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                    tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
    
    private func setUpGesture() {
        tapSettingsButton.addTarget(self, action: #selector(didTap))
        settingsButton.isUserInteractionEnabled = true
        settingsButton.addGestureRecognizer(tapSettingsButton)
    }
    
    @objc private func didTap(gestureRecognizer: UITapGestureRecognizer) {
        guard gestureRecognizer === tapSettingsButton else { return }
        delegate?.didTapSettingsButton()
    }
}


extension ViewForVC {
    func setUpVC(array: Model.RocketModel) {
        guard let images = array.flickr_images else { return }
        let url = URL(string: images.randomElement() ?? "")
        if let data = try? Data(contentsOf: url!) {
            rocketImage.image = UIImage(data: data)
        }
        
        guard let arrayName = array.name else { return }
        rocketName.text = arrayName
    }
}

extension ViewForVC: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return valuesForZeroSection.count + 1
        case 1:
            return valuesForFirstSection.count
        case 2:
            return valuesForSecondSection.count + 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "HorizontalBlockCell", for: indexPath) as! HorizontalBlockCell
                cell.selectionStyle = .none
                cell.backgroundColor = .black
                cell.parametersValues = self.parametersValuesView
                cell.horizontalBlockCV.reloadData()
                return cell
            } else {
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
                cell.backgroundColor = .black
                cell.selectionStyle = .none
                cell.lineName.text = lineNamesSection0[indexPath.row - 1]
                cell.lineValue.text = valuesForZeroSection[indexPath.row - 1]
                return cell
            }
        case 1:
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCellForStage", for: indexPath) as! TableViewCellForStage
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            cell.lineNameForStage.text = lineNamesForStage[indexPath.row]
            cell.lineValueForStage.text = valuesForFirstSection[indexPath.row]
            if indexPath.row == 0 {
                cell.lineMeasureForStage.text = "     "
            }
            if indexPath.row == 1 {
                cell.lineMeasureForStage.text = "ton"
            }
            if indexPath.row == 2 {
                cell.lineMeasureForStage.text = "sec"
            }
            return cell
        case 2:
            if indexPath.row == 3 {
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCellButton", for: indexPath) as! TableViewCellButton
                cell.backgroundColor = .black
                cell.selectionStyle = .none
                return cell
            } else {
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCellForStage", for: indexPath) as! TableViewCellForStage
                cell.backgroundColor = .black
                cell.selectionStyle = .none
                cell.lineNameForStage.text = lineNamesForStage[indexPath.row]
                if valuesForSecondSection.isEmpty != true {
                    cell.lineValueForStage.text = valuesForSecondSection[indexPath.row]
                }
    
                if indexPath.row == 0 {
                    cell.lineMeasureForStage.text = "     "
                }
                if indexPath.row == 1 {
                    cell.lineMeasureForStage.text = "ton"
                }
                if indexPath.row == 2 {
                    cell.lineMeasureForStage.text = "sec"
                }
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            cell.selectionStyle = .none
            cell.backgroundColor = .black
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return valuesForZeroSection.isEmpty ? 0 : 3
    }
    
    // MARK: Дорабоать

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        case 1:
            return "    ПЕРВАЯ СТУПЕНЬ"
        case 2:
            return "    ВТОРАЯ СТУПЕНЬ"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .systemGray5
        header.textLabel?.font = .systemFont(ofSize: 17, weight: .bold)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 && indexPath.row == 3 {
            delegate?.didTapLaunchButton()
        }
    }
}


