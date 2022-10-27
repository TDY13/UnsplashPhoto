//
//  Font+Extension.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//

import UIKit

enum ProximaNova: String {
    case regular = "ProximaNova-Regular"
    case bold = "ProximaNova-Bold"
    case semibold = "ProximaNova-Semibold"
}

extension UIFont {
    static func proximaNova(type: ProximaNova, ofSize: CGFloat) -> UIFont {
        if let font = UIFont(name: type.rawValue, size: ofSize) {
            return font
        } else {
            return .systemFont(ofSize: ofSize)
        }
    }
}
