//
//  SectionHeaderView.swift
//  Jimmy Store
//
//  Created by 윤병일 on 2020/06/22.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

final class SectionHeaderView : UICollectionReusableView {
    static let identifier = "SectionHeaderView"
    private let blurView = UIVisualEffectView()
    private let titleLabel = UILabel()
    
    required init?(coder: NSCoder) {
     fatalError("init(coder :) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        let blurEffect = UIBlurEffect(style: .dark)
        blurView.effect = blurEffect
        addSubview(blurView)
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        blurView.contentView.addSubview(titleLabel)
        
    }
    
    func setupConstraints() {
        [blurView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: blurView.trailingAnchor)
        ])
    }
    
   
    func configure(title : String) {
        titleLabel.text = title
    }
    
}

