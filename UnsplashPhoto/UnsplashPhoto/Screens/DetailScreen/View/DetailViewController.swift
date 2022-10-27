//
//  DetailViewController.swift
//  UnsplashPhoto
//
//  Created by DiOS on 23.10.2022.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var mainView = DetailView()
    let vm = DetailViewModel()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let photoObject = vm.photoObject else { return }
        
        if photoObject.objectID.isTemporaryID == true {
            print(CoreDataManager.shared.getAllObjects().count)
            CoreDataManager.shared.delete(object: photoObject)
        }
    }
    
    private func initViewController() {
        configurePhotoObject()
        
        mainView.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        mainView.shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        mainView.likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
    }
    
    private func configurePhotoObject() {
        if let photo = vm.photoObject?.photo {
            self.mainView.photoImage.image = UIImage(data: photo)
        }
        
        if let authorPhoto = vm.photoObject?.authorPhoto {
            self.mainView.authorPhotoImage.image = UIImage(data: authorPhoto)
        }
        
        mainView.authorNameLabel.text = vm.photoObject?.authorName
        if let photoObject = vm.photoObject?.likes {
            mainView.likesLabel.text = "\(photoObject) likes"
        }
        
        if let publishedDate = vm.photoObject?.publicationDate {
            mainView.publicationDateLabel.text = "Published at \(String(describing: publishedDate))".maxLength(length: 23)
        }
        
        if vm.photoObject?.objectID.isTemporaryID == true {
            mainView.isLikePhoto = false
        } else {
            mainView.isLikePhoto = true
        }
    }
}
//MARK: - Add targets
extension DetailViewController {
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapShareButton() {
        let image: UIImage? = UIImage(named: R.Images.share)
        let activityViewController = UIActivityViewController(activityItems: [ image ], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @objc private func didTapLikeButton() {
        
        if mainView.isLikePhoto == false || mainView.isLikePhoto == nil {
            CoreDataManager.shared.saveContext()
        } else {
            guard let photoObject = vm.photoObject else { return }
            CoreDataManager.shared.delete(object: photoObject)
        }
        mainView.isLikePhoto?.toggle()
    }
}
