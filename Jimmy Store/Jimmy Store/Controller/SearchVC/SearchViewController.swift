//
//  SearchViewController.swift
//  Jimmy Store
//
//  Created by 윤병일 on 2020/06/20.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class SearchViewController : UIViewController {
    
    private let datas = DataProvider.getMerchandises()
    private var filteredDatas: [MerchandiseCategory]?
    
    private var safeArea: UILayoutGuide { super.view.safeAreaLayoutGuide }

    private let collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerReferenceSize = CGSize(width: 60, height: 60)
        layout.sectionHeadersPinToVisibleBounds = true
        
        return layout
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collView.backgroundColor = .white
        collView.dataSource = self
        collView.delegate = self
        collView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        collView.register(SectionHeaderView.self,
                          forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                          withReuseIdentifier: SectionHeaderView.identifier)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTab(_:)))
        tapGesture.cancelsTouchesInView = false
        collView.addGestureRecognizer(tapGesture)
        
        return collView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationItem.title = "검색"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
        
        super.view.addSubview(self.searchBar)
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.safeArea.topAnchor),
            self.searchBar.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor),
            self.searchBar.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        
        let collView = self.collectionView
        self.view.addSubview(collView)
        
        collView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            collView.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor),
            collView.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor),
            collView.bottomAnchor.constraint(equalTo: self.safeArea.bottomAnchor),
        ])
    }
    
    
    @objc private func handleTab(_ sender: UITapGestureRecognizer) {
        self.searchBar.resignFirstResponder()
    }
}

//MARK: - extension
extension SearchViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { self.filteredDatas?.count ?? 0 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.filteredDatas?[section].merchandises.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CustomCell.dequeueCell(collectionView, indexPath)
        
        if let data = self.filteredDatas?[indexPath.section].merchandises[indexPath.row] {
            var img: UIImage?
            
            if data.imageName.isEmpty {
                img = UIImage(systemName: "xmark")
            } else {
                img = UIImage(named: data.imageName)
            }
            
            cell.configure(image: img, title: data.name, price: data.price)
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath)
        -> UICollectionReusableView {
            
            let headerView = SectionHeaderView.dequeueHeaderSupplementaryView(collectionView, indexPath)
            
            if let data = self.filteredDatas?[indexPath.section] {
                headerView.configure(title: data.name)
            }
            
            return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int)
        -> CGSize {
            
        CGSize(width: view.frame.size.width, height: 30)
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let datas = self.filteredDatas {
            let category = datas[indexPath.section]
            let merchandise = category.merchandises[indexPath.item]
            
            let detailItemVC = DetailViewController(merchandise: merchandise)
            super.parent?.navigationController?.pushViewController(detailItemVC, animated: true)
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            self.filteredDatas = nil
            
        } else {
            let strippedString = searchText.trimmingCharacters(in: CharacterSet.whitespaces)
            let searchItems = strippedString.components(separatedBy: " ") as [String]
            let predicates = searchItems.map { createPredicate(searchText: $0, keyPath: \Merchandise.name) }
            let compoundPredicates = NSCompoundPredicate(orPredicateWithSubpredicates: predicates)

            let filteredResults = self.datas.compactMap { category -> MerchandiseCategory? in
                let items = category.merchandises.filter { compoundPredicates.evaluate(with: $0) }
                
                if items.count > 0 {
                    let newCategory = MerchandiseCategory(name: category.name)
                    items.forEach { newCategory.append($0) }
                    return newCategory
                }
                
                return nil
            }
            
            self.filteredDatas = filteredResults
        }
        
        self.collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    func createPredicate<Root, Value>(searchText: String, keyPath: KeyPath<Root, Value>) -> NSPredicate {
        let expression = NSExpression(forKeyPath: \Merchandise.name)
        let searchTextExpression = NSExpression(forConstantValue: searchText)
        let comparisonPredicate = NSComparisonPredicate(leftExpression: expression,
                                                            rightExpression: searchTextExpression,
                                                            modifier: .direct,
                                                            type: .contains,
                                                            options: [.caseInsensitive, .diacriticInsensitive])
        
        return comparisonPredicate
    }
}
