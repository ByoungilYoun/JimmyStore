import Foundation

final class MerchandiseCategory {
    let name: String
    var merchandises = [Merchandise]()
    
    
    init(name: String) {
        self.name = name
    }
    
    
    func append(_ newElement: Merchandise) {
        self.merchandises.append(newElement)
    }
}
