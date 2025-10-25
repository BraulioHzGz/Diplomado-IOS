//
//  CaptionImage.swift
//  Fakestagram
//
//  Created by Braulio Hernández González on 25/10/25.
//

import UIKit

final class CaptionedImageView: UIView {
    
    @IBOutlet private var image: UIImageView!
    @IBOutlet private var caption: UILabel!
    
    var showCaption: Bool = false {
        didSet {
            caption.isHidden = !showCaption
        }
    }
    
    
    var captionedImage: CaptionedImage? {
        didSet {
            image.image = captionedImage?.image
            caption.text = captionedImage?.caption
        }
    }
    
    //MARK: Programático
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewWithBundle()
    }
    
    //MARK: desde interface builder
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViewWithBundle()
    }
    
    
    private func setUpViewWithBundle() {
        guard let contentView = Bundle.main.loadNibNamed("CaptionedImageView", owner: self)?.first as? UIView else { return }
        addSubview(contentView)
        
        // Siempre para desactivar constraints
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
