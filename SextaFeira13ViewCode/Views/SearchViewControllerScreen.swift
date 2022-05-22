//
//  SearchViewControllerScreen.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 21/05/22.
//

import UIKit

class SearchViewControllerScreen: UIView {

    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.placeholder = "Ex: Coraline"
        return bar
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocols(
        delegate: UITableViewDelegate,
        dataSource: UITableViewDataSource,
        searchDelegate: UISearchBarDelegate) {
            self.searchBar.delegate = searchDelegate
            self.tableView.delegate = delegate
            self.tableView.dataSource = dataSource
    }
    
    private func addViews() {
        self.addSubview(self.searchBar)
        self.addSubview(self.tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
