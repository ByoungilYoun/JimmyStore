import UIKit

final class MerchandiseVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var datas = DataProvider.getMerchandises()
    
    private let flowlayout: UICollectionViewFlowLayout
    
    
    init() {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: 100, height: 100)
        flowlayout.minimumLineSpacing = 15
        flowlayout.minimumInteritemSpacing = 15
        flowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        //헤더 크기
        flowlayout.headerReferenceSize = CGSize(width: 60, height: 60)
        //헤더 고정
        flowlayout.sectionHeadersPinToVisibleBounds = true
        
        self.flowlayout = flowlayout
        
        super.init(collectionViewLayout: flowlayout)
        
        super.collectionView.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    private func setupCollectionView() {
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)

//        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
    }
    
    //MARK: - dataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int { self.datas.count }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datas[section].merchandises.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        let data = self.datas[indexPath.section].merchandises[indexPath.item]
        //cell.configure(image: UIImage(named: data.imageName))
        cell.configure(image: UIImage(systemName: "xmark"), title: data.name, price: data.price)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = datas[indexPath.section].merchandises[indexPath.item]
        let detailVC = DetailViewController()
    
        detailVC.productName = datas[indexPath.section].name
        detailVC.titleName = data.name
        detailVC.price = String(data.price)
        detailVC.descriptions = data.description
        super.parent?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    //MARK: - header 뷰 나타내기
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as! SectionHeaderView
        let category = datas[indexPath.section]
        
        header.configure(title: category.name)
        return header
    }
    
    //MARK: - header 뷰 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 30)
    }
    
}

