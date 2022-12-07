//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by HauNguyen on 04/12/2565 BE.
//

import UIKit

func generateRandomData() -> [[UIColor]] {
    let numberOfRows = 20
    let numberOfItemsPerRow = 15

    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    public let models = generateRandomData()
    
    private var storedOffsets = [Int: CGFloat]()
    
    private let homeFeedTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.configNavigation()
        self.setupView()
        self.setupLayouts()
    }
    
    private func setupView() {
        self.view.addSubview(self.homeFeedTableView)
        self.homeFeedTableView.delegate = self
        self.homeFeedTableView.dataSource = self
        self.homeFeedTableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        
        // Header
        let headerView = UIView(frame: CGRect(x: self.view.bounds.maxX, y: self.view.bounds.maxY, width: self.view.bounds.width, height: 540))
        headerView.backgroundColor = .brown
        self.homeFeedTableView.tableHeaderView = headerView
    }
    
    // Config navigation
    private func configNavigation() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupLayouts() {
        self.homeFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        self.homeFeedTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.homeFeedTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.homeFeedTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.homeFeedTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
