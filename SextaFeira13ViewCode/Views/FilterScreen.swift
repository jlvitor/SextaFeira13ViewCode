//
//  FilterScreen.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 22/05/22.
//

import UIKit

protocol FilterScreenProtocol: AnyObject {
    func segmentedChanged(_ sender: UISegmentedControl)
}

class FilterScreen: UIView {
    
    private weak var delegate: FilterScreenProtocol?
    
    func delegate(delegate: FilterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Maiores de 18", "Menores de 18"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.selectedSegmentIndex = 0
        segmented.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
        return segmented
    }()

    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collection.setCollectionViewLayout(layout, animated: true)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func segmentedValueChanged(_ sender: UISegmentedControl) {
        self.delegate?.segmentedChanged(sender)
    }
    
    public func configCollectionViewProtocols(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSource
    }
    
    private func addViews() {
        self.addSubview(self.segmentedControl)
        self.addSubview(self.collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.segmentedControl.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.collectionView.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 10),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
