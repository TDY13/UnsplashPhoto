//
//  FavouritesView.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//

import UIKit

class FavouritesView: UIView {
    private let titleLabel: UILabel = {
        let obj = UILabel()
        obj.text = R.String.favourite
        obj.textColor = UIColor(named: R.Color.dark)
        obj.font = .proximaNova(type: .bold, ofSize: 17)
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let size = floor((UIScreen.main.bounds.width - (24 * 2) - 10) / 2)
        layout.itemSize = CGSize(width: size, height: size * (192/160))
        layout.minimumLineSpacing = 24
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        let obj = UICollectionView(frame: .zero, collectionViewLayout: layout)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .clear
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
        
        addSubview(titleLabel)
        addSubview(collectionView)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
