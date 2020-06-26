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
    var productName = ""
    var titleName = ""
    var price = 0
    var realPrice = ""
    var descriptions = ""
    var data: Merchandise!
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
    
    convenience init(merchandise: Merchandise) {
        self.init()
        
        self.productName = merchandise.categoryName
        self.titleName = merchandise.name
        self.price = (merchandise.price)
        self.descriptions = merchandise.description1
        
        self.data = merchandise
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
//MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realPrice = limitDigits(to: price)
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
    
    func limitDigits (to numString : Int) -> String {
        let number = numString

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: number as NSNumber) ?? "0"
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        var img: UIImage?
        
        if data.imageName.isEmpty {
            img = UIImage(systemName: "xmark")
        } else {
            img = UIImage(named: data.imageName)
        }
        
        imageView.image = img
        imageView.contentMode = .scaleToFill
        view.addSubview(imageView)
        
        titleLabel.text = titleName
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        
        priceLabel.text = realPrice + "원 부터"
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.textColor = .systemBlue
        view.addSubview(priceLabel)
        
        describeLabel.text = descriptions
        describeLabel.textAlignment = .left
        describeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        describeLabel.textColor = .black
        describeLabel.numberOfLines = 0
        view.addSubview(describeLabel)
        
//        view.addSubview(containerView)
        
        bucketButton.setTitle("장바구니 담기", for: .normal)
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
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        describeLabel.translatesAutoresizingMaskIntoConstraints = false
        describeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        describeLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        describeLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        describeLabel.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.topAnchor.constraint(equalTo: describeLabel.bottomAnchor, constant: 150).isActive = true
//        containerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
//        containerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
//        containerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        
        bucketButton.translatesAutoresizingMaskIntoConstraints = false
        bucketButton.topAnchor.constraint(equalTo: describeLabel.bottomAnchor, constant: 120).isActive = true
        bucketButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        bucketButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        bucketButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.4).isActive = true
        
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.topAnchor.constraint(equalTo: describeLabel.bottomAnchor, constant: 120).isActive = true
        orderButton.leadingAnchor.constraint(equalTo: bucketButton.trailingAnchor, constant: 10).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        orderButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        orderButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.4).isActive = true
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
        Singleton.shared.append(item: self.data)
        
        present(alert, animated: true)

    }
    
    private func orderAlertAction(){
        let alert = UIAlertController(title: "", message: "주문하시겠습니까?", preferredStyle: .actionSheet)
        let okAlert = UIAlertAction(title: "주문하기", style: .default) { _ in
            let alert = UIAlertController(title: "", message: "주문완료!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
        let cancelAlert = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        alert.addAction(okAlert)
        alert.addAction(cancelAlert)
        present(alert, animated: true)
    }
}
