//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by HauNguyen on 04/12/2565 BE.
//

import UIKit
import SwiftUI


class HomeViewController: BaseViewController {
    
    // MARK: - Variables
    
    private let homeFeedTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.configNavigation()
        self.setupViews()
        self.setupLayouts()
        self.reloadData()
    }
    
    private func setupViews() {
        self.view.addSubview(self.homeFeedTableView)
        self.homeFeedTableView.delegate = self
        self.homeFeedTableView.dataSource = self
        self.homeFeedTableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        
        // Header
        let headerView = HomeViewHeader(frame: CGRect(origin: .zero, size: CGSize(width: self.view.bounds.width, height: CGFloat(350).relativeToIphone8Height())))
        self.homeFeedTableView.tableHeaderView = headerView
        
        // this is the replacement of implementing: "collectionView.addSubview(refreshControl)"
        self.homeFeedTableView.refreshControl?.addTarget(self, action: #selector(self.reloadData), for: .valueChanged)
    }
    
    // Config navigation
    private func configNavigation() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupLayouts() {
        self.homeFeedTableView.setupLayoutConstraint(superView: self)
    }
    
    @objc private func reloadData() {
        APICaller.shared.certification(listType: .movie) { data in
            print("\(data)")
        }
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

extension HomeViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = self.homeFeedTableView.tableHeaderView as? HomeViewHeader else { return }

        header.stretchyHeader.scrollViewDidScroll(scrollView: self.homeFeedTableView)
    }

}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        PreviewUIViewController(viewController: HomeViewController())
    }
}
