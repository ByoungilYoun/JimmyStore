//
//  CustomCell.swift
//  Jimmy Store
//
//  Created by 윤병일 on 2020/06/22.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

final class CustomCell : UICollectionViewCell {
    static let identifier = "CustomCell"
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        
        setUpViews()
        setUpConstraints()
    }
    
    private func setUpViews() {
        clipsToBounds = true // 겹치지 않게
        layer.cornerRadius = 5
        
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        nameLabel.textAlignment = .left
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 10)
        nameLabel.sizeToFit()
        nameLabel.numberOfLines = 0
        contentView.addSubview(nameLabel)
        
        priceLabel.textAlignment = .left
        priceLabel.textColor = .white
        priceLabel.font = UIFont.boldSystemFont(ofSize: 10)
        contentView.addSubview(priceLabel)
    }
    
    private func setUpConstraints() {
        [imageView, nameLabel, priceLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 50),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(image : UIImage?, title : String, price : Int ) {
        let commaPrice = limitDigits(to: price)
        
        imageView.image = image
        nameLabel.text = title
        priceLabel.text = commaPrice + "원"
    }
    
    func limitDigits (to numString : Int) -> String {
        let number = numString

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: number as NSNumber) ?? "0"
    
        
    }
    
    
    class func dequeueCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> CustomCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
    }
}
