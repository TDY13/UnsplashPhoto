//
//  HomeCollectionViewCell.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let id = String(describing: HomeCollectionViewCell.self)
    
    let photoImage: UIImageView = {
        let obj = UIImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.contentMode = .scaleAspectFill
        obj.backgroundColor = .clear
        obj.clipsToBounds = true
        obj.layer.cornerRadius = 10
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
        clipsToBounds = true
        layer.cornerRadius = 10
        contentView.addSubview(photoImage)
        
        photoImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photoImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        photoImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        photoImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
