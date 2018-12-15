//
//  AuthVC.swift
//  BreakPoint
//
//  Created by McKinney family  on 7/23/18.
//  Copyright © 2018 FasTek Technologies. All rights reserved.
//
import Firebase
import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
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
    
    
    
    @IBAction func LogInExtUserPressed(_ sender: Any) {
        let logInVC = storyboard?.instantiateViewController(withIdentifier: "ExistingUserLoginVC")
        present(logInVC!, animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
