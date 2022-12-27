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
    
    private let homeViewHeader: HomeViewHeader = HomeViewHeader()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        self.homeViewHeader.frame = .init(origin: self.view.bounds.origin, size: .init(width: self.view.bounds.width, height: CGFloat(350).relativeToIphone8Height()))
        self.homeFeedTableView.tableHeaderView = self.homeViewHeader
        
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
//        APICaller.shared.getChanges(type: .movie) { data in
//            print("\(data)")
//        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        header.textLabel?.font = .medium(size: 18)
        header.textLabel?.frame = CGRect(origin: header.bounds.origin, size: .init(width: 100, height: header.bounds.height))
        header.textLabel?.textColor = .textColor
        header.textLabel?.text = header.textLabel?.text?.lowercased()
    }
    
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
        let cell = CollectionViewTableViewCell()
        
        return cell.bounds.height * 5
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
