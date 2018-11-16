//
//  UploadVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class UploadVC: UIViewController {

    @IBOutlet weak var imgClV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClV()
    }
    private func setupClV() {
        self.imgClV.delegate = self
        self.imgClV.dataSource = self
    }
    
}

extension UploadVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
