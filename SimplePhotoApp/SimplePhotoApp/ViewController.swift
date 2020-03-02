//
//  ViewController.swift
//  ContactsClone
//
//  Created by Riley John Gibbs on 2/16/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var takerController: UIImagePickerController!
    @IBOutlet weak var imageView: UIImageView!
    
    let saver = UserDefaults(suiteName: "saveMyPhotos") //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getPhotos()
        //savePhotoURL()
        // Do any additional setup after loading the view.
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video, completionHandler: {(_) in return})
            default:
                return
        }
        /*
        _ = UIImage(named: "img.png")
        let imageData:NSData = imageView.image!.pngData()! as NSData
        UserDefaults.standard.set(imageData, forKey: "saveMyImage")
        let data = UserDefaults.standard.object(forKey: "saveMyImage") as! NSData
        imageView.image = UIImage(data: data as Data)
 */
    }
       


    @IBAction func takePicture(_ sender: Any) {
        takeIt()
        //savePhotoURL()
    }
    func takeIt() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
    }
    
    
    @IBAction func saveThePhoto(_ sender: Any) {
        let imageData = imageView.image!.pngData()
        let compressedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Photo Saved", message: "Your photo has been saved", preferredStyle: .alert)
        let betAction = UIAlertAction(title: "Bet", style: .default, handler: nil)
        alert.addAction(betAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func retrievePhoto(_ sender: Any) {
        takerController.sourceType = .photoLibrary
        takerController.allowsEditing = true
        present(takerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
        if let newImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = newImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    func savePhotoURL() {
        saver?.set(imageView, forKey: "savedPhotos")
        //saver?.synchronize()
        //I might not need the line above. Apple doesn't advise using the synchronize method to force save the data
    }
    
    func getPhotos() {
        let photoData = saver?.value(forKeyPath: "savedSong")
        if photoData != nil {
             imageView = photoData as? UIImageView
        }
    }
 */
}
