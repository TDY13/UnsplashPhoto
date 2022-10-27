//
//  HomeView.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//

import UIKit

class HomeView: UIView {
    
    let searchBar: UISearchBar = {
        let obj = UISearchBar()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.placeholder = R.String.search
        obj.showsScopeBar = true
        obj.searchBarStyle = .minimal
        return obj
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = PinterestLayout()
        let obj = UICollectionView(frame: .zero, collectionViewLayout: layout)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.showsVerticalScrollIndicator = false
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
        
        addSubview(searchBar)
        addSubview(collectionView)
        
        searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 48).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
