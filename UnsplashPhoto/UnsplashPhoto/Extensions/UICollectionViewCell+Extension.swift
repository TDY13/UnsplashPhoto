//
//  UICollectionViewCell+Extension.swift
//  UnsplashPhoto
//
//  Created by DiOS on 23.10.2022.
//

import UIKit

extension  UICollectionViewCell {
    func showAnimation()  {
        UIView.animate(withDuration: 0.2, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 5, options: [],animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
    
    func hideAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 5, options: .curveEaseIn,animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 1, y: 1)
        },completion: nil)
    }
}
