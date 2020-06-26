//
//  MainTabBarController.swift
//  Jimmy Store
//
//  Created by 윤병일 on 2020/06/20.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class MainTabBarController : UITabBarController {
  
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    super.view.backgroundColor = .white
    super.delegate = self

    tabBar.barTintColor = UIColor.white
    
    let homeVC = HomeViewController()
    homeVC.tabBarItem = UITabBarItem(title: "쇼핑하기", image: UIImage(systemName: "tv"), tag: 0)
    
    let searchVC = SearchViewController()
    searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass") , tag: 0)
    
    let listVC = ShoppingListViewController()
    let listNaviVC = UINavigationController(rootViewController: listVC)
    listNaviVC.navigationItem.title = "장바구니"
    listNaviVC.tabBarItem = UITabBarItem(title: "장바구니", image: UIImage(systemName: "bag"), tag: 0)
    
    viewControllers = [homeVC, searchVC, listNaviVC]
    searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass") , tag: 1)
    
    let emptyVC = UIViewController()
    emptyVC.tabBarItem = UITabBarItem(title: "장바구니", image: UIImage(systemName: "bag"), tag: 2)
    
    viewControllers = [homeVC, searchVC, emptyVC]
  }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if tabBarController.viewControllers?.firstIndex(of: viewController) == 2 {
            super.navigationController?.pushViewController(ShoppingListViewController(), animated: true)
            return false
        }
        
        return true
    }
}
