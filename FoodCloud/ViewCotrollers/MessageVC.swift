//
//  MessageVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class MessageVC: UIViewController {
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageRootView: UIView!
    @IBOutlet weak var textViewBottom: NSLayoutConstraint!
    
    var messageArr = ["상품 거래가 확정되었습니다."]
    var dateArr = [String]() {
        didSet {
            messageTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        appendDate()
        
        messageView.applyRadius(radius: messageView.frame.height/2)
        messageView.applyBorder(width: 1, color: #colorLiteral(red: 0.6784313725, green: 0.6784313725, blue: 0.6784313725, alpha: 1))
        setupTableView()
        setupTextView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    func appendDate() {
        let dateFommatter = DateFormatter()
        dateFommatter.dateFormat = "a hh:mm"
        dateArr.append(dateFommatter.string(from: Date()))
        
    }
    func scrollToBottom(){
        let indexPath = IndexPath(row: dateArr.count - 1, section: 0)
        self.messageTableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
    }
    
    private func setupTableView(){
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.tableFooterView = UIView(frame: .zero)
        messageTableView.separatorStyle = .none
    }
    
    private func setupTextView() {
        messageTextView.delegate = self
        
        let tapDidsmiss = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.messageTableView.addGestureRecognizer(tapDidsmiss)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       
    }
    
    @IBAction func sendAction(_ sender: UIButton) {
        if messageTextView.text != "" {
            messageArr.append(messageTextView.text)
            appendDate()
            messageTextView.text = ""
            scrollToBottom()
        }
    }
}
extension MessageVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = messageTableView.dequeueReusableCell(withIdentifier: "RecieveMessageCell") as! RecieveMessageCell
            cell.messageTextView.text = messageArr[indexPath.row]
            cell.timeLabel.text = dateArr[indexPath.row]
            return cell
            
        } else {
            let cell = messageTableView.dequeueReusableCell(withIdentifier: "SendMessageCell") as! SendMessageCell
            cell.messageTextView.text = messageArr[indexPath.row]
            cell.timeLabel.text = dateArr[indexPath.row]
            return cell
        }
    }
}

extension MessageVC: UITextViewDelegate {
    
    @objc func dismissKeyboard() {
        messageTextView.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.textViewBottom.constant = keyboardHeight
            self.scrollToBottom()
        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.textViewBottom.constant = 0
    }
    
}
