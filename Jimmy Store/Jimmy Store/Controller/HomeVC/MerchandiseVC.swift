import UIKit

final class MerchandiseVC: UICollectionViewController {
    
    private var datas: [MerchandiseCategory] = []
    
    private let flowlayout: UICollectionViewFlowLayout
    
    
    init() {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: 100, height: 100)
        flowlayout.minimumLineSpacing = 15
        flowlayout.minimumInteritemSpacing = 15
        flowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        flowlayout.headerReferenceSize = CGSize(width: 60, height: 60)
        flowlayout.sectionHeadersPinToVisibleBounds = true
        
        self.flowlayout = flowlayout
        
        super.init(collectionViewLayout: flowlayout)
        
        super.collectionView.backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    private func setupCollectionView() {
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
//        collectionView.register(<#T##viewClass: AnyClass?##AnyClass?#>, forSupplementaryViewOfKind: <#T##String#>, withReuseIdentifier: <#T##String#>)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        
    }
    
    //MARK: - dataSource
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
////        <#code#>
//    }
//
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datas.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        cell.configure(image: UIImage(named: datas[indexPath.item].name))
        
        return cell
        
    }
}



