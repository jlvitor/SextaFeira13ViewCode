//
//  SearchDetailScreen.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 22/05/22.
//

import UIKit

class SearchDetailScreen: UIView {
    
    lazy var movieView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.label.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 4
        return view
    }()
    
    lazy var movieImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        return img
    }()
    
    lazy var movieLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 5
        return stack
    }()
    
    lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    lazy var movieYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .label
        label.text = "Descrição"
        return label
    }()
    
    lazy var textDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    lazy var friendsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .label
        label.text = "Amigos que gostam desse filme"
        return label
    }()
    
    lazy var friendsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        table.tableFooterView = UIView()
        table.register(FriendMovieTableViewCell.self, forCellReuseIdentifier: FriendMovieTableViewCell.identifier)
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
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSourve: UITableViewDataSource) {
        self.friendsTableView.delegate = delegate
        self.friendsTableView.dataSource = dataSourve
    }
    
    private func addViews() {
        self.addSubview(self.movieView)
        self.movieView.addSubview(self.movieImageView)
        self.addSubview(self.movieLabelStackView)
        self.movieLabelStackView.addArrangedSubview(self.movieTitleLabel)
        self.movieLabelStackView.addArrangedSubview(self.movieYearLabel)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.textDescriptionLabel)
        self.addSubview(self.friendsLabel)
        self.addSubview(self.friendsTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.movieView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.movieView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.movieImageView.topAnchor.constraint(equalTo: self.movieView.topAnchor),
            self.movieImageView.leadingAnchor.constraint(equalTo: self.movieView.leadingAnchor),
            self.movieImageView.trailingAnchor.constraint(equalTo: self.movieView.trailingAnchor),
            self.movieImageView.bottomAnchor.constraint(equalTo: self.movieView.bottomAnchor),
            self.movieImageView.heightAnchor.constraint(equalToConstant: 150),
            self.movieImageView.widthAnchor.constraint(equalToConstant: 374),
            
            self.movieLabelStackView.topAnchor.constraint(equalTo: self.movieView.bottomAnchor, constant: 20),
            self.movieLabelStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.movieLabelStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.movieLabelStackView.bottomAnchor, constant: 20),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.textDescriptionLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 20),
            self.textDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.textDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.textDescriptionLabel.heightAnchor.constraint(equalToConstant: 100),
            
            self.friendsLabel.topAnchor.constraint(equalTo: self.textDescriptionLabel.bottomAnchor, constant: 20),
            self.friendsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.friendsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.friendsTableView.topAnchor.constraint(equalTo: self.friendsLabel.bottomAnchor, constant: 10),
            self.friendsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.friendsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.friendsTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
