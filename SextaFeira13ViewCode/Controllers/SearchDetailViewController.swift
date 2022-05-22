//
//  SearchDetailViewController.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 21/05/22.
//

import UIKit

class SearchDetailViewController: UIViewController {
    
    static let identifier: String = "SearchDetailViewController"
    
    var screen: SearchDetailScreen?
    var movie: Movie?
    var newFriendArray: [Friend] = []
    
    override func loadView() {
        self.screen = SearchDetailScreen()
        self.screen?.configTableViewProtocols(delegate: self, dataSourve: self)
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "Background")
        self.setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Private methods
    private func setupViews() {
        guard let data = movie else { return }
        
        self.screen?.movieImageView.image = UIImage(named: data.landscapePoster)
        self.screen?.movieTitleLabel.text = data.movieName
        self.screen?.movieYearLabel.text = data.movieYear
        self.screen?.textDescriptionLabel.text = data.movieDescription
    }
    
    private func getIdToCompare() {
        if let movieId = movie?.id {
            newFriendArray = friendData.filter { friend in
                friend.friendMovieId?.contains(movieId) ?? false
            }
        }
    }
}

//MARK: - UITableViewDelegate
extension SearchDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

//MARK: - UITableViewDataSource
extension SearchDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getIdToCompare()
        return newFriendArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.screen?.friendsTableView.dequeueReusableCell(withIdentifier: FriendMovieTableViewCell.identifier, for: indexPath) as? FriendMovieTableViewCell
        cell?.setupCell(data: newFriendArray[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
