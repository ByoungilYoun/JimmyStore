import Foundation

final class Merchandise: NSObject {
    @objc var name: String
    let imageName: String
    let price: Int
    let description1: String
    
    
    init(name: String, imageName: String, price: Int, description: String) {
        self.name = name
        self.imageName = imageName
        self.price = price
        self.description1 = description
    }
}
