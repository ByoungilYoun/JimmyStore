import Foundation

final class Merchandise {
    let name: String
    let imageName: String
    let price: Int
    let description: String
    
    
    init(name: String, imageName: String, price: Int, description: String) {
        self.name = name
        self.imageName = imageName
        self.price = price
        self.description = description
    }
}
