//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 10.07.23.
//

import UIKit

class MainTabController: UITabBarController {

    //MARK: PAge lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configuringTabBar()
    }
    
    //MARK: Configuring the tab bar
    private func configuringTabBar() {
        
        //Initializing the views
        let v1 = UINavigationController(rootViewController: HomeViewController())
        let v2 = UINavigationController(rootViewController: UpcomingViewController())
        let v3 = UINavigationController(rootViewController: TopSearchViewController())
        let v4 = UINavigationController(rootViewController: DownloadsViewController())
        
        v1.tabBarItem.image = UIImage(systemName: "house")
        v2.tabBarItem.image = UIImage(systemName: "play.circle")
        v3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        v4.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
        
        v1.title = "Home"
        v2.title = "Coming soon"
        v3.title = "Top Search"
        v4.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([v1, v2, v3, v4], animated: true)
        
        
        
    }


}

