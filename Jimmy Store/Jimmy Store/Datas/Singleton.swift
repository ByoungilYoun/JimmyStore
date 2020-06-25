//
//  Singleton.swift
//  Jimmy Store
//
//  Created by 윤병일 on 2020/06/25.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import Foundation

final class Singleton {
    static let shared = Singleton()
    
    private init() {}
    
    var shoppingList : [String : String] = [:]
}
