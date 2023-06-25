//
//  EditPFPViewController.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/25/23.
//

import UIKit
import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import PhotosUI
import FirebaseStorage

class EditPFPViewController: UIViewController {
    let storage = Storage.storage()
    
    //MARK: variable to store the picked Image...
    var pickedImage:UIImage?
    
    var editPFPScreen = EditPFPView()
    
    override func loadView() {
        view = editPFPScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        editPFPScreen.buttonSubmit.addTarget(self, action: #selector(onSubmitTapped), for: .touchUpInside)
        
        editPFPScreen.buttonTakePhoto.menu = getMenuImagePicker()

        title = "Edit"
        
    }
    
    //MARK: menu for buttonTakePhoto setup...
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    @objc func onSubmitTapped(){
        var profilePhotoURL:URL?

        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 80){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesUsers")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")

                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                profilePhotoURL = url
                                print("successful upload")
                                self.setPhotoOfTheUserInFirebaseAuth(photoURL: profilePhotoURL)
                            } else {
                                print(error!)
                            }
                        })
                    } else {
                        print(error!)
                    }
                })
            }
        }else{
            print("no photo selected")
            setPhotoOfTheUserInFirebaseAuth(photoURL: profilePhotoURL)
        }
    }
    

    //MARK: We set the name of the user after we create the account...
    func setPhotoOfTheUserInFirebaseAuth(photoURL: URL?){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.photoURL = photoURL

        print("\(String(describing: photoURL))")
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                    self.navigationController?.popViewController(animated: true)

            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }

}

//MARK: adopting required protocols for PHPicker...
extension EditPFPViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(
                    ofClass: UIImage.self,
                    completionHandler: { (image, error) in
                        DispatchQueue.main.async{
                            if let uwImage = image as? UIImage{
                                self.editPFPScreen.buttonTakePhoto.setImage(
                                    uwImage.withRenderingMode(.alwaysOriginal),
                                    for: .normal
                                )
                                self.pickedImage = uwImage
                            }
                        }
                    }
                )
            }
        }
    }
}

//MARK: adopting required protocols for UIImagePicker...
extension EditPFPViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.editPFPScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}
