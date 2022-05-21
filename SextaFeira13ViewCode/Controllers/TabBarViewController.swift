//
//  TabBarViewController.swift
//  SextaFeira13ViewCode
//
//  Created by Jean Lucas Vitor on 21/05/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        let homeScreen = HomeViewController()
        let searchScreen = UINavigationController(rootViewController: SearchViewController())
        let filterScreen = FilterViewController()
        let friendsScreen = UINavigationController(rootViewController: FriendsViewController())
        let settingsScreen = SettingsViewController()
        
        self.setViewControllers([homeScreen, searchScreen, filterScreen, friendsScreen, settingsScreen], animated: false)
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .white.withAlphaComponent(0.4)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Home"
        items[0].image = UIImage(systemName: "house.fill")
        
        items[1].title = "Busca"
        items[1].image = UIImage(systemName: "magnifyingglass")
        
        items[2].title = "Filtro"
        items[2].image = UIImage(systemName: "list.bullet")
        
        items[3].title = "Amigos"
        items[3].image = UIImage(systemName: "person.3.fill")
        
        items[4].title = "Configurações"
        items[4].image = UIImage(systemName: "gearshape.fill")
    }
    
}
