//
//  MovieListCollectionViewCellScreen.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 21/05/22.
//

import UIKit

class MovieCollectionViewCellScreen: UIView {
    
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
    
    lazy var movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
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
    
    public func setupCell(data: Movie) {
        self.movieImageView.image = UIImage(named: data.portraitPoster)
        self.movieNameLabel.text = data.movieName
    }
    
    private func addViews() {
        self.addSubview(movieView)
        self.movieView.addSubview(movieImageView)
        self.addSubview(movieNameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.movieView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.movieView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.movieView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            self.movieView.widthAnchor.constraint(equalToConstant: 160),
            self.movieView.heightAnchor.constraint(equalToConstant: 240),
            
            self.movieImageView.topAnchor.constraint(equalTo: self.movieView.topAnchor),
            self.movieImageView.leadingAnchor.constraint(equalTo: self.movieView.leadingAnchor),
            self.movieImageView.trailingAnchor.constraint(equalTo: self.movieView.trailingAnchor),
            self.movieImageView.bottomAnchor.constraint(equalTo: self.movieView.bottomAnchor),
            
            self.movieNameLabel.topAnchor.constraint(equalTo: self.movieView.bottomAnchor),
            self.movieNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.movieNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.movieNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
