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
    private let tableView = UITableView()
    private let shared = Singleton.shared
    var realPrice = ""
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        setNavigation()
        setUI()
        setConstraint()
        
    }
    
 
    //MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        navigationController?.navigationBar.barStyle = .default
//        navigationController?.navigationBar.tintColor = .white
    }
    
    //MARK: - func
    
    func limitDigits (to numString : Int) -> String {
        let number = numString

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: number as NSNumber) ?? "0"
    }
    
    
    private func setNavigation() {
        navigationItem.title = "장바구니"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        let orderBarButton = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(orderButtonTap))
        orderBarButton.tag = 0
        navigationItem.rightBarButtonItem = orderBarButton
    }
    
  
    
    private func setUI() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        view.addSubview(tableView)
        tableView.backgroundColor = .white
    }
    
    private func setConstraint() {
        let guide = view.safeAreaLayoutGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    //MARK: - @objc func orderButtonTap()
    @objc func orderButtonTap() {
          let alert = UIAlertController(title: "주문완료!", message: "주문이 정상적으로 되었습니다.", preferredStyle: .alert)
          let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
          let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
          alert.addAction(ok)
          alert.addAction(cancel)
          
          present(alert, animated: true)
        
        self.shared.shoppingList.removeAll()
        tableView.reloadData()
      }
}


//MARK: - extension DataSource

extension ShoppingListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { Singleton.shared.count  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell
        
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
            
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            
        }
        
        if let data = Singleton.shared.getItem(idx: indexPath.row) {
            
            var img: UIImage?
            
            if data.imageName.isEmpty {
                img = UIImage(systemName: "xmark")
            } else {
                img = UIImage(named: data.imageName)
            }
            
            realPrice = limitDigits(to: data.price)
            
            cell.imageView?.image = img
            cell.textLabel?.text = data.name
            cell.detailTextLabel!.text = realPrice + " 원"
        }
        
        
        
        return cell
    }
}

//MARK: - extension Delegate
extension ShoppingListViewController : UITableViewDelegate {
    
    //목록 삭제하기 
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "삭제") { (action, sourceView, actionPerformed) in
            self.shared.shoppingList.remove(at: indexPath.item)
            tableView.reloadData()
            actionPerformed(true)
        }
        
        deleteAction.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}
