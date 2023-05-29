//
//  AnasayfaViewController.swift
//  LEVO
//
//  Created by Arca Sahin on 20.05.2023.
//

import UIKit
import Firebase


class AnasayfaViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var messages: [Message] = [Message(body: "Lütfen seviyeyi koruyalım.")]
    
    
    let db = Firestore.firestore()
    
    var yorumDizisi = [String]()


    
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadMessages()
        
     
        
    }
    
    
    @IBAction func sendPressed(_ sender: Any) {
        if messageField.text != "" {
            if  let messageBody = messageField.text {
                db.collection("messages").addDocument(data: ["body": messageBody,
                                                             
                                                             "date": Timestamp(date: Date())])
                { (error) in
                    if let e = error {
                        print(e)
                    }
                    else {print("succesfully wsaved")
                    }
                }
                DispatchQueue.main.async {
                    self.messageField.text = ""
                }
            }
        }
    }
    func loadMessages() {
        
        db.collection("messages").order(by: "date", descending: false).addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                self.messages = []
                
                for document in querySnapshot!.documents {
                    let data  = document.data()
                    if let messageBody = data["body"] as? String{
                        let newMessage = Message(body: messageBody)
                        self.messages.append(newMessage)
                        
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                            
                        }
                        
                    }
                }
            }
                }
            
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedCell
        let message = messages[indexPath.row]
        cell.yorumText.text = message.body
        
        
        cell.layer.cornerRadius = cell.frame.height / 2
        
        return cell
    }
    
}
