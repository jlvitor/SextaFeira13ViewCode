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
        self.view.backgroundColor = UIColor(named: "Background")
        setupTabBar()
        setupTabBarController()
    }
    
    private func setupTabBar() {
        self.tabBar.isTranslucent = false
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemWidth = 40
        self.tabBar.itemSpacing = 35
        
        self.tabBar.tintColor = UIColor(named: "Icon tabBar selected")
        self.tabBar.unselectedItemTintColor = UIColor(named: "Icon tabBar unselected")
    }
    
    private func setupTabBarController() {
        let homeScreen = HomeViewController()
        let searchScreen = UINavigationController(rootViewController: SearchViewController())
        let filterScreen = FilterViewController()
        let friendsScreen = UINavigationController(rootViewController: FriendsViewController())
        let settingsScreen = SettingsViewController()
        
        self.setViewControllers([homeScreen, searchScreen, filterScreen, friendsScreen, settingsScreen], animated: false)
    
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
