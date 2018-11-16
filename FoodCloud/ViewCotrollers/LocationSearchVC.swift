//
//  LocationSearchVC.swift
//  Woong-iOS
//
//  Created by Leeseungsoo on 2018. 7. 4..
//  Copyright © 2018년 Leess. All rights reserved.
//

import UIKit

class LocationSearchVC: UIViewController {
    
    let cellId = "LocationSearchCell"
    var addressArr = [ "서울시 은평구 대조동 84-32" ,"서울시 마포구 연남동 364-8", "홍익대학교 서울캠퍼스"]
    var roadArr = ["서울 은평구 통일로71가길 27-15", "서울 마포구 연남로 83", "서울 마포구 와우산로 231"]
    var searchAddress: [Address] = []
    var flag = false
    
    @IBOutlet var searchBarView: UIView!
    @IBOutlet var searchBarTxtFd: UITextField!
    @IBOutlet var searchTableView: UITableView!
    @IBOutlet var searchResultTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    private func setupView() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchBarView.applyRadius(radius: 17.5)
        searchTableView.tableFooterView = UIView(frame: .zero)
        searchTableView.separatorStyle = .none
        searchBarTxtFd.addTarget(self, action: #selector(search(_:)), for: .editingChanged)
        searchBarTxtFd.addTarget(self, action: #selector(changeResultTitle(_:)), for: .editingChanged)
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func search(_ sender: UITextField) {
        if let searchText = sender.text {
            if searchText == "" {
                flag = false
                self.searchTableView.reloadData()
                return
            }
            flag = true
            KakaoAddressService.shareInstance.searchAddressWithKeyword(query: searchText, completion: { data in
                self.searchAddress = data
                self.searchTableView.reloadData()
            }) { (errCode) in
                self.simpleAlert(title: "네트워크 오류", message: "서버가 응답하지 않습니다.")
            }
        }
    }
    
    @objc func changeResultTitle(_ sender: UITextField) {
        if gbno(sender.text?.isEmpty) {
            searchResultTitle.textColor = UIColor.rgb(red: 112, green: 112, blue: 112)
            searchResultTitle.text = "최근 주소"
        } else {
            searchResultTitle.textColor = UIColor.rgb(red: 82, green: 156, blue: 119)
            searchResultTitle.text = "주소 검색 결과 \"" + gsno(sender.text) + "\""
        }
    }
}

extension LocationSearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !flag {
            return addressArr.count
        } else {
            return searchAddress.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! LocationSearchCell
        if !flag {
            cell.addressLabel.text = addressArr[indexPath.row]
            cell.roadAddressLabel.text = roadArr[indexPath.row]
            cell.deleteButton.tag = indexPath.row
            cell.deleteButton.addTarget(self, action: #selector(deleteCellFromButton(button:)), for: .touchUpInside)
            cell.deleteButton.isHidden = false
            
        } else {
            cell.addressLabel.text = searchAddress[indexPath.row].placeName
            cell.roadAddressLabel.text = searchAddress[indexPath.row].roadAddressName
            cell.deleteButton.isHidden = true
            
        }
        return cell
    }
    
    @objc func deleteCellFromButton(button: UIButton) {
        addressArr.remove(at: button.tag)
        roadArr.remove(at: button.tag)
        searchTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(searchAddress[indexPath.row].x)
        print(searchAddress[indexPath.row].y)
        NotificationCenter.default.post(name: Notification.Name("setAddress"), object: searchAddress[indexPath.row])
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
