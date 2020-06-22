//
//  HomeViewController.swift
//  Jimmy Store
//
//  Created by 윤병일 on 2020/06/20.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController {
    
    private let advertisementVC = AdvertisementVC()
    private let merchandiseVC = MerchandiseVC()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUI()
    }
    
    // MARK:- UI
    private func setUI() {
        
        let guide = super.view.safeAreaLayoutGuide
        
        if let adv = self.advertisementVC.view,
            let merchandise = self.merchandiseVC.view {
            
            super.view.addSubview(adv)
            adv.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                adv.topAnchor.constraint(equalTo: guide.topAnchor),
                adv.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
                adv.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
                adv.heightAnchor.constraint(equalToConstant: 230),
            ])
            
            super.view.addSubview(merchandise)
            merchandise.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                merchandise.topAnchor.constraint(equalTo: adv.bottomAnchor),
                merchandise.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
                merchandise.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
                merchandise.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            ])
        }
    }
}
