//
//  FriendTableViewCell.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 31/05/22.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    static let identifier: String = "FriendTableViewCell"
    
    var screen: FriendTableViewCellScreen = FriendTableViewCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: Friend) {
        self.screen.setupCell(data: data)
    }
    
    private func addView() {
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.screen)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
