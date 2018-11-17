//
//  ViewController.swift
//  CreateMeme
//
//  Created by Kun Huang on 11/15/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePicker = UIImagePickerController()
    var takenImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }

    @IBAction func takePicture(_ sender: UIButton) {
        useCamera()
    }
    
    @IBAction func usePhoto(_ sender: UIButton) {
        usePhoto()
        //UIImageWriteToSavedPhotosAlbum(takenImage!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func useCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("camera not availble")
            usePhoto()
        }
    }
    
    func usePhoto() {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            takenImage = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "PickPicture", sender: self)
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
}

