//
//  FavouriteCollectionViewCell.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//

import UIKit

protocol FavouriteCellProtocolDelegate: AnyObject {
    func deleteButtonDidTapped(cell: FavouriteCollectionViewCell)
}

class FavouriteCollectionViewCell: UICollectionViewCell {
    static let id = String(describing: FavouriteCollectionViewCell.self)
    
    weak var delegate: FavouriteCellProtocolDelegate?
    
    let photoImage: UIImageView = {
        let obj = UIImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .white
        obj.layer.cornerRadius = 10
        obj.clipsToBounds = true
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    let authorImage: UIImageView = {
        let obj = UIImageView()
        obj.clipsToBounds = true
        obj.image = UIImage(named: R.Images.photo)
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    let authorNameLabel: UILabel = {
        let obj = UILabel()
        obj.font = .proximaNova(type: .semibold, ofSize: 15)
        obj.textColor = UIColor(named: R.Color.dark)
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    let heartButton: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(named: R.Images.blackHeart), for: .normal)
        obj.setImage(UIImage(named: R.Images.redHeart), for: .selected)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .clear
        obj.isSelected = true
        obj.makeSystemButton(obj)
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        authorImage.layer.cornerRadius = authorImage.frame.height / 2
    }
    
    private func setup() {
        contentView.addSubview(photoImage)
        contentView.addSubview(authorImage)
        contentView.addSubview(authorNameLabel)
        contentView.addSubview(heartButton)
        
        photoImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photoImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        photoImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        photoImage.heightAnchor.constraint(equalTo: photoImage.widthAnchor, constant: 8).isActive = true
        
        authorImage.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 8).isActive = true
        authorImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        authorImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        authorImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        authorNameLabel.centerYAnchor.constraint(equalTo: authorImage.centerYAnchor).isActive = true
        authorNameLabel.leadingAnchor.constraint(equalTo: authorImage.trailingAnchor, constant: 8).isActive = true
        authorNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: heartButton.leadingAnchor, constant: -8).isActive = true
        
        heartButton.centerYAnchor.constraint(equalTo: authorImage.centerYAnchor).isActive = true
        heartButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        heartButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        heartButton.addTarget(self, action: #selector(didTapHeartButton(_:)), for: .touchUpInside)
    }
}

extension FavouriteCollectionViewCell {
    @objc private func didTapHeartButton(_ sender: UIButton) {
        delegate?.deleteButtonDidTapped(cell: self)
    }
}
