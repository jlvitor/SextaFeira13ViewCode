//
//  SearchViewController.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 21/05/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    var screen: SearchScreen?
    var filteredMovie: [Movie] = movieData.sorted{$0.movieName < $1.movieName}
    var movies: [Movie] = movieData.sorted{$0.movieName < $1.movieName}
    
    override func loadView() {
        self.screen = SearchScreen()
        self.screen?.configProtocols(delegate: self, dataSource: self, searchDelegate: self)
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func filterMovieForSearch(searchText: String) {
        // Pega o valor que esta sendo digital na searchBar
        if searchText != "" {
            // Filtra movieData, acessa o nome, converte para lowercase e compara com o valor digitano na searchBar e retornar um novo array em ordem alfabética
            filteredMovie = movieData.filter({ movie in
                return movie.movieName.lowercased().contains(searchText.lowercased())
            }).sorted{$0.movieName < $1.movieName}
        } else {
            // Caso não seja digitado nada, retorna um array de movies em ordem alfabética
            self.filteredMovie = movies
        }
        self.screen?.tableView.reloadData()
    }
}

//MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterMovieForSearch(searchText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

//MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let row = tableView.indexPathForSelectedRow?.row else { return }
        
        let vc: SearchDetailViewController = SearchDetailViewController()
        let data = self.filteredMovie[row]
        let movie: Movie = Movie(
            id: data.id,
            movieName: data.movieName,
            portraitPoster: data.portraitPoster,
            landscapePoster: data.landscapePoster,
            movieYear: data.movieYear,
            movieDescription: data.movieDescription,
            ageGroup: data.ageGroup
        )
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
        self.screen?.tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = filteredMovie[indexPath.row].movieName
        return cell
    }
}
