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
            chosenPictureImageView.addSubview(topLabel)
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
            chosenPictureImageView.addSubview(botLabel)
        }
        UIImageWriteToSavedPhotosAlbum(chosenPictureImageView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Image Saved!", message: "Your image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func addTextToImage(addText: String) {
        
    }
    

}
