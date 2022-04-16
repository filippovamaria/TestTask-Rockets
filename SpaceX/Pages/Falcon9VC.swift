//
//  Falcon9VC.swift
//  SpaceX
//
//  Created by Мария Филиппова on 11.04.2022.
//

import UIKit

class Falcon9VC: UIViewController {
    
    private var tag = 1
    private var id: String?
    private let networkService = NetworkService()
    private var dataSource: [Model.RocketModel] = []
    private var valuesForZeroSectionVC: [String] = []
    private var valuesForFirstSectionVC: [String] = []
    private var valuesForSecondSectionVC: [String] = []
    private var parametersValuesVC: [String] = []
    
    private lazy var viewForVC: ViewForVC = {
        let viewForVC = ViewForVC()
        viewForVC.delegate = self
        viewForVC.isUserInteractionEnabled = true
        viewForVC.translatesAutoresizingMaskIntoConstraints = false
        return viewForVC
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        networkService.request { [self] (result) in
            switch result {
            case .success(let rockets):
                self.dataSource = rockets
                self.viewForVC.settingsButton.alpha = 1
                self.viewForVC.setUpVC(array: (dataSource[tag]))
                self.valuesForZeroSectionVC = createArrayForZeroSection(array: dataSource[tag])
                viewForVC.valuesForZeroSection = self.valuesForZeroSectionVC
                self.valuesForFirstSectionVC = createArrayForFirstSection(array: dataSource[tag])
                viewForVC.valuesForFirstSection = self.valuesForFirstSectionVC
                self.valuesForSecondSectionVC = createArrayForSecondSection(array: dataSource[tag])
                viewForVC.valuesForSecondSection = self.valuesForSecondSectionVC
                self.parametersValuesVC = createArrayForHorizontalBlock(array: dataSource[tag])
                viewForVC.parametersValuesView = self.parametersValuesVC
                self.id = dataSource[tag].id
                viewForVC.tableView.reloadData()
            case .failure(_):
                print("Error")
            }
        }
    }
    
    private func setUpView() {
        self.view.addSubview(viewForVC)
        
        NSLayoutConstraint.activate([viewForVC.topAnchor.constraint(equalTo: view.topAnchor),
                                     viewForVC.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     viewForVC.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     viewForVC.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

extension Falcon9VC: ViewForVCDelegate {
 
    func didTapSettingsButton() {
        let settingVC = SettingVC()
        self.present(settingVC, animated: true, completion: nil)
    }
    
    func didTapLaunchButton() {
        let rocketLaunchesVC  = RocketLaunchesVC()
        rocketLaunchesVC.rocketID = dataSource[tag].id
        navigationController?.pushViewController(rocketLaunchesVC, animated: true)
    }
}


