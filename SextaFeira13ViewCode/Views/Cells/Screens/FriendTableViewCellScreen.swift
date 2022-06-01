//
//  FriendTableViewCellScreen.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 31/05/22.
//

import UIKit

enum FriendMovieCommon: String {
    case commonMoviesLabel = "Filmes em comum: "
}

class FriendTableViewCellScreen: UIView {

    lazy var friendView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        view.layer.cornerRadius = 35
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
        img.layer.cornerRadius = 35
        return img
    }()
    
    lazy var stackLabel: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var friendNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    lazy var commonMoviesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: Friend) {
        let friendMoviesCount = movieData.filter { movie in
            data.friendMovieId?.contains(movie.id) ?? false
        }.count
        
        friendImageView.image = UIImage(named: data.friendImage)
        friendNameLabel.text = data.friendName
        commonMoviesLabel.text = FriendMovieCommon.commonMoviesLabel.rawValue + "\(friendMoviesCount)"
    }
    
    private func addViews() {
        addSubview(friendView)
        friendView.addSubview(friendImageView)
        addSubview(stackLabel)
        stackLabel.addArrangedSubview(friendNameLabel)
        stackLabel.addArrangedSubview(commonMoviesLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            friendView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            friendView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            friendView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            friendImageView.heightAnchor.constraint(equalToConstant: 70),
            friendImageView.widthAnchor.constraint(equalToConstant: 70),
            
            stackLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackLabel.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 20),
            stackLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
}
