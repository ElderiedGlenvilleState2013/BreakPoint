//
//  AuthVC.swift
//  BreakPoint
//
//  Created by McKinney family  on 7/23/18.
//  Copyright © 2018 FasTek Technologies. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    //ibactions
    @IBAction func facebookSignInBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func signInWithEmailBtnPressed(_ sender: Any) {
    let logInVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(logInVC!, animated: true, completion: nil)
        
    }
    
    @IBAction func googleSignInBtnPressed(_ sender: Any) {
        
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
