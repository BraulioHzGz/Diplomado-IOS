//
//  FeedViewController.swift
//  Fakestagram
//
//  Created by Braulio Hernández González on 18/10/25.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var firstCaptionImageView:  CaptionedImageView!
    @IBOutlet weak var secondCaptionImageView: CaptionedImageView!
    @IBOutlet weak var thirdCaptionImageView:  CaptionedImageView!
    
    
    var pictureType: PictureType = .dog
    var showCaption: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showOrHideCaptions()
        setImagesAndCaptions()
    }
    
    private func showOrHideCaptions() {
        firstCaptionImageView.showCaption  = showCaption
        secondCaptionImageView.showCaption = showCaption
        thirdCaptionImageView.showCaption  = showCaption
    }
    
    private func setImagesAndCaptions() {
        let captionedImage = pictureType.captionedImage
        
        firstCaptionImageView.captionedImage  = captionedImage[0]
        secondCaptionImageView.captionedImage  = captionedImage[1]
        thirdCaptionImageView.captionedImage  = captionedImage[2]
    }
}
