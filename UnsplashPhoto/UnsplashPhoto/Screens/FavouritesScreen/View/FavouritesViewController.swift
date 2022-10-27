//
//  FavouritesViewController.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//


import UIKit

class FavouriteViewController: UIViewController {
    private let mainView = FavouritesView()
    var vm = FavouriteViewModel()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(FavouriteCollectionViewCell.self, forCellWithReuseIdentifier: FavouriteCollectionViewCell.id)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vm.favouritePhotosArray = CoreDataManager.shared.getAllObjects()
        mainView.collectionView.reloadData()
    }
    
    private func showAlert(index: IndexPath) {
        let alert = UIAlertController(title: "Видалити цю картинку з обраного?", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ні!", style: .cancel)
        let deletePhoto = UIAlertAction(title: "Видалити", style: .destructive) { action in
            let object = self.vm.favouritePhotosArray.remove(at: index.row)
            CoreDataManager.shared.delete(object: object)
            self.mainView.collectionView.deleteItems(at: [index])
        }
        alert.addAction(cancel)
        alert.addAction(deletePhoto)
        present(alert, animated: true)
    }
}
//MARK: - CollectionView delegate & dataSource
extension FavouriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.favouritePhotosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteCollectionViewCell.id, for: indexPath) as? FavouriteCollectionViewCell else { return UICollectionViewCell() }
        cell.delegate = self
        let data = vm.favouritePhotosArray[indexPath.row]
        if let photoData = data.photo {
            cell.photoImage.image = UIImage(data: vm.getPhoto(photoData))
        }
        if let authorName = data.authorName {
            cell.authorNameLabel.text = vm.getAuthorName(authorName)
        }
        
        if let photoData = data.authorPhoto {
            cell.authorImage.image = UIImage(data: vm.getPhoto(photoData))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.showAnimation()
        cell?.hideAnimation()
        let detailViewController = DetailViewController()
        let detailObject = vm.favouritePhotosArray[indexPath.row]
        detailViewController.vm.photoObject = detailObject
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
//MARK: - FavouriteCellProtocol delegate
extension FavouriteViewController: FavouriteCellProtocolDelegate {
    func deleteButtonDidTapped(cell: FavouriteCollectionViewCell) {
        guard let indexPath = mainView.collectionView.indexPath(for: cell) else { return }
        showAlert(index: indexPath)
    }
}
