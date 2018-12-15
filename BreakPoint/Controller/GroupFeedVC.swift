//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by McKinney family  on 8/23/18.
//  Copyright © 2018 FasTek Technologies. All rights reserved.
//
import Firebase
import UIKit

class GroupFeedVC: UIViewController {

    
    //var or let
    var groupMessages = [Message]()
    
    
    
    //outlets
    @IBOutlet weak var tableview:UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    
    
    
    
    
    
    
    
    
    
    
    
    //ibaction
    @IBAction func backBtnWasPressed(_ sender: Any) {
      //  dismiss(animated: true, completion: nil)
      dismissDetail()
        
    }
    
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: Auth.auth().currentUser!.uid, withGroupKey: group?.key) { (complete) in
                if complete {
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                }
            }
        }
        
        
    }
    
    
    var group: Group?
    
    
    //func
    func initData(forGroup group: Group) {
        self.group = group
        
    }
    
    
    
    
    
    
    
    
    //override func
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyBoard()
    
        tableview.delegate = self
        tableview.dataSource = self
    
        // Do any additional setup after loading the view.
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DataService.instance.getEmailsFor(group: group!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")
        }
        groupTitleLbl.text = group?.groupTitle
        membersLbl.text = group?.members.joined(separator: ", ")
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableview.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.tableview.scrollToRow(at: IndexPath.init(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
                
            })
        }
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}


extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else { return UITableViewCell() }
       let message = groupMessages[indexPath.row]
        
        DataService.instance.getUserName(forUID: message.senderId) { (email) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
            
            
        }
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
 
}

