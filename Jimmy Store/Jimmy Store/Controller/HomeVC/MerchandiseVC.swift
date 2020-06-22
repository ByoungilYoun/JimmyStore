import UIKit

final class MerchandiseVC: UICollectionViewController {
    
    private let datas: [MerchandiseCategory]
    
    
    init() {
        self.datas = DataProvider.getMerchandises()
        
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    
    override func viewDidLoad() {
        super.view.backgroundColor = .systemGreen
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}
