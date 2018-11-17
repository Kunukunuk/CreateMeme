//
//  PictureViewController.swift
//  CreateMeme
//
//  Created by Kun Huang on 11/16/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
