//
//  UploadVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class UploadVC: UIViewController {
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var expireLbl: UITextField!
    @IBOutlet weak var infoLbl: UITextField!
    @IBOutlet weak var timeLbl: UITextField!
    @IBOutlet weak var addressTxf: UITextField!
    var myAddress: Address? {
        didSet {
            addressTxf.text = myAddress?.placeName
        }
    }
    @IBOutlet weak var imgClV: UICollectionView!
    let imagePicker : UIImagePickerController = UIImagePickerController()
    var imageArr: [UIImage] = [] {
        didSet {
            imgClV.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClV()
        setNoti()
    }
    
    private func setupClV() {
        self.imgClV.delegate = self
        self.imgClV.dataSource = self
    }
    
    @IBAction func uploadAction(_ sender: UIBarButtonItem) {
        reset()
        
    }
    private func reset() {
        nameLbl.text = ""
        expireLbl.text = ""
        infoLbl.text = ""
        timeLbl.text = ""
        addressTxf.text = ""
        imageArr.removeAll()
        self.tabBarController?.selectedIndex = 0
    }
    
    private func setNoti() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(setAddress(noti:)), name: NSNotification.Name("setAddress") , object: nil)
    }
    
    @objc func setAddress(noti:Notification) {
        if let address = noti.object as? Address{
            self.myAddress = address
        }
    }
    
    @IBAction func locationAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Address", bundle: nil).instantiateViewController(withIdentifier: "LocationSearchVC") as! LocationSearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension UploadVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imgClV.dequeueReusableCell(withReuseIdentifier: "ImageUploadCell", for: indexPath) as! ImageUploadCell
        cell.uploadImgV.applyRadius(radius: 3)
        if indexPath.item != 0 {
            cell.uploadImgV.image = #imageLiteral(resourceName: "imgNullimg")
            cell.isUserInteractionEnabled = false
        } else {
            cell.uploadImgV.image = #imageLiteral(resourceName: "imgAddimg")
            cell.isUserInteractionEnabled = true
        }
        if imageArr.count > 0 && indexPath.item == 0 {
            cell.uploadImgV.image = imageArr[indexPath.item]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openGallery()
    }
    
}

extension UploadVC:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.delegate = self
            
            // false이면 이미지를 자르지 않고
            // true면 자유자제로 크롭 가능
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("사용자가 취소함")
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageArr.append(editedImage)
        } else if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageArr.append(originalImage)
        }
        self.dismiss(animated: true) {
            
            self.imgClV.reloadData()
        }
    }

}

