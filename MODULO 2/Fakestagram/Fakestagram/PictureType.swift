//
//  PictureType.swift
//  Fakestagram
//
//  Created by Braulio Hernández González on 18/10/25.
//

import UIKit

enum PictureType {
    case dog, cat
    
    var captionedImage: [(image: UIImage, caption: String)] {
        switch self {
            case .dog:
                return [
                    (UIImage.dog1, "Peluzo"),
                    (UIImage(resource: .dog2), "Fido"),
                    (UIImage(named: "dog-3") ?? UIImage(), "Milaneso")
                ]
            case .cat:
                return [
                    (UIImage.cat1, "Milo"),
                    (UIImage(resource: .cat2), "Tlacoyo"),
                    (UIImage.cat3, "Froztinky")
                ]
        }
    }
}
