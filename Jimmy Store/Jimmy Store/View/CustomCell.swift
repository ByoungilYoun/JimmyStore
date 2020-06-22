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
        layer.cornerRadius = 20
        
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.font = .preferredFont(forTextStyle: .title2)
        imageView.addSubview(nameLabel)
    }
    
    private func setUpConstraints() {
        [imageView, nameLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configure(image : UIImage? ) {
        imageView.image = image
     //   nameLabel.text = title
    }
}
