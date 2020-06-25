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
    
    private var shoppingList = [Merchandise]()
    
    var count: Int { self.shoppingList.count }
    
    
    func append(item: Merchandise) {
        if self.shoppingList.firstIndex(of: item) == nil {
            self.shoppingList.append(item)
        }
    }
    
    func remove(item: Merchandise) {
        if let idx = self.shoppingList.firstIndex(of: item) {
            self.shoppingList.remove(at: idx)
        }
    }
    
    func getItem(idx: Int) -> Merchandise? {
        
        if idx < self.count {
            return self.shoppingList[idx]
        }
        
        return nil
    }
}
