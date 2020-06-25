import Foundation

final class Merchandise: NSObject {
    let categoryName: String
    @objc var name: String
    let imageName: String
    let price: Int
    let description1: String
    
    
    init(categoryName: String, name: String, imageName: String, price: Int, description: String) {
        self.categoryName = categoryName
        self.name = name
        self.imageName = imageName
        self.price = price
        self.description1 = description
    }
}
