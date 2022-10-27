//
//  DetailView.swift
//  UnsplashPhoto
//
//  Created by DiOS on 23.10.2022.
//


import UIKit

class DetailView: UIView {
    var isLikePhoto: Bool? {
        didSet {
            if let isLikePhoto = isLikePhoto {
                isLikePhotos(isLikePhoto)
            }
        }
    }
    
    private let titleLabel: UILabel = {
        let obj = UILabel()
        obj.text = R.String.details
        obj.textColor = UIColor(named: R.Color.dark)
        obj.font = .proximaNova(type: .bold, ofSize: 17)
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    let backButton: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(named: R.Images.back), for: .normal)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.makeSystemButton(obj)
        return obj
    }()
    
    let shareButton: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(named: R.Images.share), for: .normal)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.makeSystemButton(obj)
        return obj
    }()
    
    let photoImage: UIImageView = {
        let obj = UIImageView()
        obj.contentMode = .scaleAspectFill
        obj.image = UIImage(named: "image 1")
        obj.layer.cornerRadius = 10
        obj.clipsToBounds = true
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    let authorPhotoImage: UIImageView = {
        let obj = UIImageView()
        obj.clipsToBounds = true
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    let authorNameLabel: UILabel = {
        let obj = UILabel()
        obj.text = "Dima"
        obj.textColor = UIColor(named: R.Color.dark)
        obj.font = .proximaNova(type: .semibold, ofSize: 18)
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    let likeButton: UIButton = {
        let obj = UIButton()
        obj.setImage(UIImage(named: R.Images.redHeart), for: .selected)
        obj.setImage(UIImage(named: R.Images.blackHeart), for: .normal)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = UIColor(named: R.Color.whiteGray)
        obj.isSelected = true
        obj.makeSystemButton(obj)
        return obj
    }()
    
    let likesLabel: UILabel = {
        let obj = UILabel()
        obj.text = "6,87000 likes"
        obj.textColor = UIColor(named: R.Color.dark)
        obj.font = .proximaNova(type: .semibold, ofSize: 15)
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    let publicationDateLabel: UILabel = {
        let obj = UILabel()
        
        obj.text = "Published on August 23, 2022".maxLength(length: 10)
        obj.textColor = UIColor(named: R.Color.lightGray)
        obj.font = .proximaNova(type: .regular, ofSize: 15)
        obj.translatesAutoresizingMaskIntoConstraints = false
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
        likeButton.layer.cornerRadius = likeButton.frame.height / 2
        authorPhotoImage.layer.cornerRadius = authorPhotoImage.frame.height / 2
    }
    
    private func setup() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(shareButton)
        addSubview(photoImage)
        
        addSubview(authorPhotoImage)
        addSubview(authorNameLabel)
        addSubview(likeButton)
        
        addSubview(likesLabel)
        addSubview(publicationDateLabel)
        
        let titleLabelTop = titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70)
        titleLabelTop.priority = UILayoutPriority(255)
        titleLabelTop.isActive = true
        titleLabel.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        
        shareButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        photoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        photoImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        let photoImageTop = photoImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22)
        photoImageTop.priority = UILayoutPriority(255)
        photoImageTop.isActive = true
        photoImage.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 22).isActive = true
        
        let authorPhotoImageTop = authorPhotoImage.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 16)
        authorPhotoImageTop.priority = UILayoutPriority(255)
        authorPhotoImageTop.isActive = true
        authorPhotoImage.topAnchor.constraint(greaterThanOrEqualTo: photoImage.bottomAnchor, constant: 16).isActive = true
        authorPhotoImage.leadingAnchor.constraint(equalTo: photoImage.leadingAnchor).isActive = true
        authorPhotoImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
        authorPhotoImage.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        authorNameLabel.leadingAnchor.constraint(equalTo: authorPhotoImage.trailingAnchor, constant: 16).isActive = true
        authorNameLabel.centerYAnchor.constraint(equalTo: authorPhotoImage.centerYAnchor).isActive = true
        authorNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: likeButton.leadingAnchor, constant: -5).isActive = true
        
        likeButton.centerYAnchor.constraint(equalTo: authorPhotoImage.centerYAnchor).isActive = true
        likeButton.trailingAnchor.constraint(equalTo: photoImage.trailingAnchor).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        let likesLabelTop = likesLabel.topAnchor.constraint(equalTo: authorPhotoImage.bottomAnchor, constant: 16)
        likesLabelTop.priority = UILayoutPriority(255)
        likesLabelTop.isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: photoImage.leadingAnchor).isActive = true
        likesLabel.topAnchor.constraint(greaterThanOrEqualTo: authorPhotoImage.bottomAnchor, constant: 16).isActive = true
        likesLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        let publicationDateLabelTop = publicationDateLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 2)
        publicationDateLabelTop.priority = UILayoutPriority(255)
        publicationDateLabelTop.isActive = true
        publicationDateLabel.leadingAnchor.constraint(equalTo: photoImage.leadingAnchor).isActive = true
        publicationDateLabel.topAnchor.constraint(greaterThanOrEqualTo: likesLabel.bottomAnchor, constant: 1).isActive = true
        let publicationDateLabelBottom = publicationDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        publicationDateLabelBottom.priority = UILayoutPriority(250)
        publicationDateLabelBottom.isActive = true
        publicationDateLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -15).isActive = true
        publicationDateLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private func isLikePhotos(_ like: Bool) {
        switch(like) {
        case true:
            likeButton.isSelected = true
        case false:
            likeButton.isSelected = false
        }
    }
}

