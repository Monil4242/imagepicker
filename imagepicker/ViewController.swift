//
//  ViewController.swift
//  imagepicker
//
//  Created by monil sojitra on 18/01/23.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var addPhotosButton: UIButton!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setaddPhotosButton()
        
    }


    @IBAction func addPhotosButtonAction(_ sender: UIButton) {
        showalertview()
    }
    
    func showalertview(){
        let alert = UIAlertController(title: "your choice", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "Gallery", style: .default,handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "Camera", style: .default))
        alert.addAction(UIAlertAction.init(title: "Cancel", style:.destructive))
        present(alert, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        img.image = info[.editedImage] as! UIImage
        dismiss(animated: true)
        
    }
    
    func openGallery(){
        let gallery = UIImagePickerController()
        gallery.delegate = self
        gallery.allowsEditing = true
        gallery.sourceType = .photoLibrary
        present(gallery, animated: true)
        
    }
    func setaddPhotosButton(){
        addPhotosButton.layer.cornerRadius = 5
        addPhotosButton.layer.borderWidth = 5
        addPhotosButton.layer.borderColor = UIColor.gray.cgColor
        addPhotosButton.layer.masksToBounds = true
    }
}

