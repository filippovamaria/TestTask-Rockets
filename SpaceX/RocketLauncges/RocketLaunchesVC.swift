//
//  RocketLaunchesVC.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

class RocketLaunchesVC: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RocketLaunchCell.self, forCellReuseIdentifier: "RocketLaunchCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var rocketID: String?
    private let networkServiceForRocketLaunch = NetworkServiceForRocketLaunch()
    private var rocketLaunches: [ModelLaunch.Launch] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUp()
        setUpBackButton()
//        setupNavigationBar()
        
        networkServiceForRocketLaunch.request { [self] (result) in
            switch result {
            case .success(let launches):
                for element in launches {
                    if element.rocket == rocketID! && rocketID != nil {
                        self.rocketLaunches.append(element)
                    }
                }
                self.tableView.reloadData()
            case .failure(_):
                print("Error")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setUp() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                    ])
    }
    
    private func setUpBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.black
        navBarAppearance.shadowImage = nil
        navBarAppearance.shadowColor = nil
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}

extension RocketLaunchesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rocketLaunches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "RocketLaunchCell", for: indexPath) as! RocketLaunchCell
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        cell.launchName.text = rocketLaunches[indexPath.row].name
        if rocketLaunches[indexPath.row].static_fire_date_utc != nil {
            cell.launchDate.text = rocketLaunches[indexPath.row].static_fire_date_utcString
        } else {
            cell.launchDate.text = "Информация отсутствует"
        }
        
        if rocketLaunches[indexPath.row].success! && rocketLaunches[indexPath.row].success != nil {
            cell.launchIcon.image = UIImage(named: "rocketSuc")
        } else {
            cell.launchIcon.image = UIImage(named: "rocketUnsuc")
        }
        return cell
    }
}
