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
    
    tabBar.barTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    let homeVC = HomeViewController()
    homeVC.tabBarItem = UITabBarItem(title: "쇼핑하기", image: UIImage(systemName: "tv"), tag: 0)
    
    let searchVC = SearchViewController()
    searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass") , tag: 0)
    
    let listVC = ShoppingListViewController()
    listVC.tabBarItem = UITabBarItem(title: "장바구니", image: UIImage(systemName: "bag"), tag: 0)
    
    viewControllers = [homeVC, searchVC, listVC]
    
  }
}
