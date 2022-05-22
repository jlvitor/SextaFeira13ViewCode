//
//  FilterViewController.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 21/05/22.
//

import UIKit

class FilterViewController: UIViewController {
    
    var screen: FilterScreen?
    var movieListForSegmented: [Movie] = []
    
    override func loadView() {
        self.screen = FilterScreen()
        self.screen?.configCollectionViewProtocols(delegate: self, dataSource: self)
        self.screen?.delegate(delegate: self)
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateSegmentedControll(0)
    }
    
    //MARK: - Private method
    private func updateSegmentedControll(_ index: Int) {
        switch index {
        case 0:
            movieListForSegmented = movieData.filter({ movie in
                return movie.ageGroup >= 18
            })
            self.screen?.collectionView.reloadData()
        case 1:
            movieListForSegmented = movieData.filter({ movie in
                return movie.ageGroup < 18
            })
            self.screen?.collectionView.reloadData()
        default:
            break
        }
    }
}

//MARK: - FilterScreenProtocol
extension FilterViewController: FilterScreenProtocol {
    func segmentedChanged(_ sender: UISegmentedControl) {
        guard let index = self.screen?.segmentedControl.selectedSegmentIndex else { return }
        updateSegmentedControll(index)
        self.screen?.collectionView.reloadData()
    }
}

//MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDelegate
extension FilterViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
    }
}

//MARK: - UICollectionViewDataSource
extension FilterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieListForSegmented.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell
        cell?.setupCell(data: movieListForSegmented.sorted{$0.movieName < $1.movieName}[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}
