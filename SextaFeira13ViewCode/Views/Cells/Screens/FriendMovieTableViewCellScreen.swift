//
//  FriendMovieTableViewCellScreen.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 22/05/22.
//

import UIKit

class FriendMovieTableViewCellScreen: UIView {

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    lazy var friendView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor.label.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 4
        return view
    }()
    
    lazy var friendImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 30
        return img
    }()
    
    lazy var friendNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: Friend) {
        friendImageView.image = UIImage(named: data.friendImage)
        friendNameLabel.text = data.friendName
    }
    
    private func addViews() {
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.friendView)
        self.stackView.addArrangedSubview(self.friendNameLabel)
        self.friendView.addSubview(self.friendImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.friendImageView.topAnchor.constraint(equalTo: self.friendView.topAnchor),
            self.friendImageView.leadingAnchor.constraint(equalTo: self.friendView.leadingAnchor, constant: 20),
            self.friendImageView.trailingAnchor.constraint(equalTo: self.friendView.trailingAnchor),
            self.friendImageView.bottomAnchor.constraint(equalTo: self.friendView.bottomAnchor),
            self.friendImageView.heightAnchor.constraint(equalToConstant: 60),
            self.friendImageView.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
}
