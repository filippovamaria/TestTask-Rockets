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
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUp()
        setUpBackButton()
    
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
}

extension RocketLaunchesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "RocketLaunchCell", for: indexPath) as! RocketLaunchCell
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        return cell
    }
}

