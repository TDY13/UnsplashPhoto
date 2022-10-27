//
//  HomeViewController.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    private let mainView = HomeView()
    var vm = HomeViewModel()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let photosName = mainView.searchBar.text, photosName != "" {
            HomeScreenNetworkLayer.shared.fingPhotoBy(name: photosName) { data in
                self.vm.dataArray = data.results
                
                DispatchQueue.main.async {
                    self.mainView.collectionView.reloadData()
                }
            }
        } else {
            HomeScreenNetworkLayer.shared.getRandomPhotos { data in
                self.vm.dataArray = data
                
                DispatchQueue.main.async {
                    self.mainView.collectionView.reloadData()
                }
            }
        }
    }
    
    private func initViewController() {
        if let layout = mainView.collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.id)
        
        mainView.searchBar.delegate = self
    }
}
//MARK: - CollectionView delegate & dataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.id, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        let photoData = vm.dataArray[indexPath.row]
        cell.photoImage.image = UIImage(data: vm.getData(photoData.urls.thumb))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.showAnimation()
        cell?.hideAnimation()
        let detailViewController = DetailViewController()
        let photoData = vm.dataArray[indexPath.row]
        
        if let obj = CoreDataManager.shared.getObjectWith(id: photoData.id) {
            detailViewController.vm.photoObject = obj
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.navigationController?.pushViewController(detailViewController, animated: true)
            }
        } else {
            detailViewController.vm.photoObject = vm.createObj(with: photoData)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.navigationController?.pushViewController(detailViewController, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 20)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}
//MARK: - PinterestLayout delegate
extension HomeViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        let photoData = vm.dataArray[indexPath.row]
        let urlImage = URL(string: photoData.urls.thumb)
        let dataImage = try? Data.init(contentsOf: urlImage!)
        let image = UIImage(data: dataImage!)
        let imageSize = image?.size.height
        let height = CGFloat(imageSize!)
        return height
    }
}
//MARK: SearchBar delegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("🕵️‍♂️")
        if let photosName = searchBar.text {
            let result = photosName.replacingOccurrences(of: " ", with: "+")
            HomeScreenNetworkLayer.shared.fingPhotoBy(name: result) { data in
                self.vm.dataArray = data.results
                
                DispatchQueue.main.async {
                    self.mainView.collectionView.reloadData()
                    if let layout = self.mainView.collectionView.collectionViewLayout as? PinterestLayout {
                        layout.delegate = self
                    }
                }
            }
        } else {
            HomeScreenNetworkLayer.shared.getRandomPhotos { data in
                self.vm.dataArray = data
                
                DispatchQueue.main.async {
                    self.mainView.collectionView.reloadData()
                }
            }
        }
        
        searchBar.resignFirstResponder()
        print("🕵️‍♂️")
    }
}

