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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickPicture" {
            let destinationVC = segue.destination as! PictureViewController
            destinationVC.takenImage = takenImage
        }
    }
}

