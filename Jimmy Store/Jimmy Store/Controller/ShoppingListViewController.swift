//
//  ShoppingListViewController.swift
//  Jimmy Store
//
//  Created by 윤병일 on 2020/06/20.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ShoppingListViewController : UIViewController {
    
    //MARK: - Properties
    private let shared = Singleton.shared
    
    private let tableView = UITableView()
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUI()
        setConstraint()
        
    }
    
    //MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        navigationController?.navigationBar.barStyle = .black
        setNavigation()
    }
    
    //MARK: - func
    private func setNavigation() {
        navigationItem.title = "장바구니"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
    }
    
    private func setUI() {
        view.backgroundColor = .black
        
        tableView.dataSource = self
        tableView.rowHeight = 100
        view.addSubview(tableView)
    }
    
    private func setConstraint() {
        let guide = view.safeAreaLayoutGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
}


//MARK: - extension

extension ShoppingListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell
        
        if let reusableCell 
    }
    
    
}
