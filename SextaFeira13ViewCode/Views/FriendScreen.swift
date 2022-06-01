//
//  FriendScreen.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 31/05/22.
//

import UIKit

class FriendScreen: UIView {

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        table.tableFooterView = UIView()
        table.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
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
    
    public func configProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
            self.tableView.delegate = delegate
            self.tableView.dataSource = dataSource
    }
    
    private func addViews() {
        self.addSubview(self.tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
