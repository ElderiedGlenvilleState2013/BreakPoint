//
//  FirstViewController.swift
//  BreakPoint
//
//  Created by McKinney family  on 7/1/18.
//  Copyright © 2018 FasTek Technologies. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    
    //let or constant
    
    
    
    
    
    //var
    var messageArray = [Message]()
    
    
    
    
    //iboutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    
    
    
    //ibactionts
    
    
    
    //override func
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnMessagesArray) in
            self.messageArray = returnMessagesArray.reversed()
            self.tableView.reloadData()
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}


//tableview protocal
extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return  100
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else
            { return UITableViewCell() }
        
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        DataService.instance.getUserName(forUID: message.senderId) { (returnedUsername) in
            cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
        
       
        return cell 
    }
    
}




