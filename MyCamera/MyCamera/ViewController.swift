//
//  ViewController.swift
//  MyCamera
//
//  Created by Udagawa Yuya on 2020/12/29.
//  Copyright © 2020 Udagawa Yuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var pictureImage: UIImageView!
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        let alertController = UIAlertController(title: "確認", message: "選択してください", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler: {(action) in
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "フォトライブラリー", style: .default, handler: {(action) in
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        let cancelAction = UIAlertAction(title: "キャンセル", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        alertController.popoverPresentationController?.sourceView = view
        
        present(alertController,animated: true,completion: nil)
        
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            print("カメラは利用できます")
//            let imagePickerController = UIImagePickerController()
//            imagePickerController.sourceType = .camera
//            imagePickerController.delegate = self
//            present(imagePickerController, animated: true, completion: nil)
//        } else {
//            print("カメラは利用できません")
//        }
    }
    
//    @IBAction func shareButtonAction(_ sender: Any) {
//        if let shareImage = pictureImage.image {
//            let shareItem = [shareImage]
//            let controller = UIActivityViewController(activityItems: shareItem, applicationActivities: nil)
//            controller.popoverPresentationController?.sourceView = view
//            present(controller, animated: true, completion:nil)
//        } else {
//            print("画像がありません")
//        }
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: {
            self.performSegue(withIdentifier: "showEffectView", sender: nil)
        })
        
//        pictureImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
//        dismiss(animated: true, completion: nil)
    }
    
    var captureImage : UIImage?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? EffectViewController {
            nextViewController.originalImage = captureImage
        }
    }
    
}

