//
//  FriendsViewController.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 21/05/22.
//

import UIKit

class FriendsViewController: UIViewController {
    
    var screen: FriendScreen?
    var friendSorted: [Friend] = friendData.sorted {$0.friendName < $1.friendName}
    
    override func loadView() {
        screen = FriendScreen()
        screen?.configProtocols(delegate: self, dataSource: self)
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lista de amigos"
    }
}

//MARK: - UITableViewDelegate
extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let friendSelected = friendSorted[indexPath.row]
        
        let vc: FriendsDetailViewController = FriendsDetailViewController()
//        let data = self.filteredMovie[row]
//        let movie: Movie = Movie(
//            id: data.id,
//            movieName: data.movieName,
//            portraitPoster: data.portraitPoster,
//            landscapePoster: data.landscapePoster,
//            movieYear: data.movieYear,
//            movieDescription: data.movieDescription,
//            ageGroup: data.ageGroup
//        )
//        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
        self.screen?.tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendSorted.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell
        cell?.setupCell(data: friendSorted[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
