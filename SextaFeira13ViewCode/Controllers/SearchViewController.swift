//
//  SearchViewController.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 21/05/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    var screen: SearchViewControllerScreen?
    var filteredMovie: [Movie] = movieData.sorted{$0.movieName < $1.movieName}
    var movies: [Movie] = movieData.sorted{$0.movieName < $1.movieName}
    
    override func loadView() {
        self.screen = SearchViewControllerScreen()
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
        guard let row = self.screen?.tableView.indexPathForSelectedRow?.row else { return }
        
        let vc = SearchDetailViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
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
        cell.backgroundColor = UIColor(named: "Background")
        
        return cell
    }
}
