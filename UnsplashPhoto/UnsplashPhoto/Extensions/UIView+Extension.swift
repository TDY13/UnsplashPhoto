//
//  UIView+Extension.swift
//  UnsplashPhoto
//
//  Created by DiOS on 23.10.2022.
//

import UIKit

extension UIView {
    func makeSystemButton(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDragInside,
            .touchDown
        ])
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc private func handleIn() {
        UIView.animate(withDuration: 0.15) { self.alpha = 0.55 }
    }
    
    @objc private func handleOut() {
        UIView.animate(withDuration: 0.15) { self.alpha = 1 }
    }
}
