//
//  PictureType.swift
//  Fakestagram
//
//  Created by Braulio Hernández González on 18/10/25.
//

import UIKit

enum PictureType {
    case dog, cat
    
    var captionedImage: [CaptionedImage] {
        switch self {
            case .dog:
                return [
                    .init(image: UIImage.dog1, caption: "Peluzo"),
                    .init(image: UIImage(resource: .dog2), caption: "Fido"),
                    .init(image: UIImage(named: "dog-3") ?? UIImage(), caption: "Milaneso")
                ]
            case .cat:
                return [
                    .init(image: UIImage.cat1, caption: "Milo"),
                    .init(image: UIImage(resource: .cat2), caption: "Tlacoyo"),
                    .init(image: UIImage.cat3, caption: "Froztinky")
                ]
        }
    }
}


struct CaptionedImage {
    var image: UIImage
    var caption: String?
}
