//
//  PictureViewController.swift
//  CreateMeme
//
//  Created by Kun Huang on 11/16/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit
import AVFoundation

class PictureViewController: UIViewController {

    @IBOutlet weak var chosenPictureImageView: UIImageView!
    var takenImage: UIImage?
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chosenPictureImageView.image = takenImage
    }
    
    @IBAction func saveThePhoto(_ sender: UIButton) {
        
        //let size = chosenPictureImageView.frame.size
        let reSizedImage = AVMakeRect(aspectRatio: (takenImage?.size)!, insideRect: chosenPictureImageView.frame)
        
        if let topText = topTextField.text {
            let topLabel = UILabel()
            topLabel.frame = CGRect(x: 0, y: reSizedImage.minY, width: reSizedImage.maxX, height: 50)
            topLabel.textAlignment = .center
            topLabel.textColor = UIColor.white
            topLabel.minimumScaleFactor = 0.1
            topLabel.lineBreakMode = .byClipping
            topLabel.numberOfLines = 0
            topLabel.adjustsFontSizeToFitWidth = true
            topLabel.font = topLabel.font.withSize(topLabel.frame.height * 3/4)
            topLabel.text = topText
            UIGraphicsBeginImageContextWithOptions(chosenPictureImageView.bounds.size, false, 0)
            chosenPictureImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
            topLabel.layer.render(in: UIGraphicsGetCurrentContext()!)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            chosenPictureImageView.image = newImage
        }
        
        if let botText = bottomTextField.text {
            let botLabel = UILabel()
            botLabel.frame = CGRect(x: 0, y: reSizedImage.maxY - 50, width: reSizedImage.maxX, height: 50)
            botLabel.textAlignment = .center
            botLabel.textColor = UIColor.white
            botLabel.minimumScaleFactor = 0.1
            botLabel.lineBreakMode = .byClipping
            botLabel.numberOfLines = 0
            botLabel.adjustsFontSizeToFitWidth = true
            botLabel.font = botLabel.font.withSize(botLabel.frame.height * 3/4)
            botLabel.text = botText
            UIGraphicsBeginImageContextWithOptions(chosenPictureImageView.bounds.size, false, 0)
            chosenPictureImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
            botLabel.layer.render(in: UIGraphicsGetCurrentContext()!)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            chosenPictureImageView.image = newImage
        }
//        UIImageWriteToSavedPhotosAlbum(chosenPictureImageView.image!, self, nil, nil)
//        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
