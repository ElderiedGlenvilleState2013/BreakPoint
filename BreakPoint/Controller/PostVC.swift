//
//  PostVC.swift
//  BreakPoint
//
//  Created by McKinney family  on 8/13/18.
//  Copyright © 2018 FasTek Technologies. All rights reserved.
//
import Firebase
import UIKit

class PostVC: UIViewController {

    
    
    
    //iboutlet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    
    
    
    //ibaction
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say something here..." {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = true
                    print("there was an error!")
                }
            }
        }
    }
    
    
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
        sendBtn.bindToKeyBoard()
        // Do any additional setup after loading the view.
    }

    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}


extension PostVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}






