//
//  SearchViewController.swift
//  Jimmy Store
//
//  Created by 윤병일 on 2020/06/20.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class SearchViewController : UINavigationController {
    
    private let datas = DataProvider.getMerchandises()
    private var filteredDatas: [MerchandiseCategory]?
    
    private let collectionLayout: UICollectionViewLayout = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: 100, height: 100)
        flowlayout.minimumLineSpacing = 15
        flowlayout.minimumInteritemSpacing = 15
        flowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        //헤더 크기
        flowlayout.headerReferenceSize = CGSize(width: 60, height: 60)
        //헤더 고정
        flowlayout.sectionHeadersPinToVisibleBounds = true
        
        return flowlayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collView.dataSource = self
        collView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        collView.backgroundColor = .systemBlue
        return collView
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.barTintColor = .systemTeal
        searchController.searchBar.barStyle = .default
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.delegate = self
        
//        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.extendedLayoutIncludesOpaqueBars = true
//        searchController.obscuresBackgroundDuringPresentation = false
        
        return searchController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        super.navigationItem.title = "test"
        super.navigationItem.searchController = self.searchController
        super.view.backgroundColor = .systemBlue
        
//        self.setUI()
    }
    
    // MARK:- UI
    private func setUI() {
        let guide = super.view.safeAreaLayoutGuide
        
//        super.navigationItem.title = "test"
//        super.navigationItem.searchController = self.searchController
        let searchBar = self.searchController.searchBar
        searchBar.frame = super.view.bounds
        super.view.addSubview(searchBar)
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            searchBar.topAnchor.constraint(equalTo: guide.topAnchor),
//            searchBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
//            searchBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
//            searchBar.heightAnchor.constraint(equalToConstant: 100),
//        ])
        
        
//        let collView = self.collectionView
//        super.view.addSubview(collView)
//        collView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            collView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
//            collView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
//            collView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
//            collView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
//        ])
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { self.filteredDatas?.count ?? 0 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { self.filteredDatas?[section].merchandises.count ?? 0}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        
        if let data = self.filteredDatas?[indexPath.section].merchandises[indexPath.item] {
            cell.configure(image: UIImage(systemName: "xmark"), title: data.name, price: data.price)
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.productName = filteredDatas?[indexPath.item].name ?? ""
        super.parent?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                     withReuseIdentifier: SectionHeaderView.identifier,
                                                                     for: indexPath) as! SectionHeaderView
        let category = filteredDatas?[indexPath.section]
        header.configure(title: category?.name ?? "")
        
        return header
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: super.view.frame.size.width, height: 30)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        updateSearchResults(for: searchController)
    }
}
