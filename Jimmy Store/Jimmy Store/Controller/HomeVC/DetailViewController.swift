//
//  DetailViewController.swift
//  Jimmy Store
//
//  Created by 윤병일 on 2020/06/23.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

final class DetailViewController : UIViewController {
    
//MARK: - Properties
    private let shared = Singleton.shared
    
    var productName = ""
    var titleName = ""
    var price = ""
    var descriptions = "" 
    private var datas = DataProvider.getMerchandises()
    
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let describeLabel = UILabel()
    private let containerView = UIView()
    private let bucketButton = UIButton()
    private let orderButton = UIButton()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(categoryName: String, productName: String, price: Int, descriptions: String) {
        self.init()
        
        self.productName = categoryName
        self.titleName = productName
        self.price = String(price)
        self.descriptions = descriptions
    }
    
    convenience init(categoryName: String, merchandise: Merchandise) {
        self.init(categoryName: categoryName,
                  productName: merchandise.name,
                  price: merchandise.price,
                  descriptions: merchandise.description1)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
//MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setUI()
        setConstraint()
    }
//MARK: - setNavigation()
    private func setNavigation() {
        navigationItem.title = productName
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
    }

//MARK: - setUI()
    private func setUI() {
        view.backgroundColor = .black
        
        imageView.image = UIImage(systemName: "xmark")
        imageView.contentMode = .scaleToFill
        view.addSubview(imageView)
        
        titleLabel.text = titleName
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        priceLabel.text = price + "원 부터"
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.textColor = .systemBlue
        view.addSubview(priceLabel)
        
        describeLabel.text = descriptions
        describeLabel.textAlignment = .left
        describeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        describeLabel.textColor = .white
        view.addSubview(describeLabel)
        
        view.addSubview(containerView)
        containerView.backgroundColor = .green
        
        bucketButton.setTitle("장바구니", for: .normal)
        bucketButton.setTitleColor(UIColor.systemBlue, for: .normal)
        bucketButton.backgroundColor = UIColor(red: 255/255, green: 246/255, blue: 133/255, alpha: 1.0)
        bucketButton.addTarget(self, action: #selector(bucketButtonTap), for: .touchUpInside)
        view.addSubview(bucketButton)
        
        orderButton.setTitle("주문", for: .normal)
        orderButton.setTitleColor(UIColor.white, for: .normal)
        orderButton.backgroundColor = UIColor(red: 0/255, green: 67/255, blue: 155/255, alpha: 1.0)
        orderButton.addTarget(self, action: #selector(orderButtonTap), for: .touchUpInside)
        view.addSubview(orderButton)
    }
//MARK: - setConstraint()
    private func setConstraint() {
        let guide = view.safeAreaLayoutGuide
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true

        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        describeLabel.translatesAutoresizingMaskIntoConstraints = false
        describeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive = true
        describeLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        describeLabel.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: describeLabel.bottomAnchor, constant: 200).isActive = true
        containerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        
        bucketButton.translatesAutoresizingMaskIntoConstraints = false
        bucketButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        bucketButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        bucketButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        bucketButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        orderButton.leadingAnchor.constraint(equalTo: bucketButton.trailingAnchor).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        orderButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
    }
//MARK: - @objc func bucketButtonTap
    @objc func bucketButtonTap () {
        bucketAlertAction()
    }
    
    @objc func orderButtonTap() {
        orderAlertAction()
    }
    
//MARK: - func alertAction
    private func bucketAlertAction() {
        let alert = UIAlertController(title: "장바구니에 상품이 담겼습니다", message: "장바구니로 이동하시겠습니까?", preferredStyle: .actionSheet)
        let okAlert = UIAlertAction(title: "확인", style: .default) { _ in
           let shoppingVC = ShoppingListViewController()
           super.navigationController?.pushViewController(shoppingVC, animated: true)
        }
        let cancelAlert = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(okAlert)
        alert.addAction(cancelAlert)
        present(alert, animated: true)
    }
    
    private func orderAlertAction(){
        let alert = UIAlertController(title: "", message: "주문하시겠습니까?", preferredStyle: .actionSheet)
        let okAlert = UIAlertAction(title: "주문하기", style: .default, handler: nil)
        let cancelAlert = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        alert.addAction(okAlert)
        alert.addAction(cancelAlert)
        present(alert, animated: true)
    }
}
