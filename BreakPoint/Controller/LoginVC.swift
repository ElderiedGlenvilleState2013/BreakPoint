//
//  LoginVC.swift
//  BreakPoint
//
//  Created by McKinney family  on 7/23/18.
//  Copyright © 2018 FasTek Technologies. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //outlet
    @IBOutlet weak var emailFeild: InsertTextField!
    @IBOutlet weak var passwordField: InsertTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailFeild.delegate = self
        passwordField.delegate = self
        
    }

    
    
    //ibaction
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailFeild.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailFeild.text!, andPassword: passwordField.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailFeild.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailFeild.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("sucessfully registered user")
                        })
                        
                    } else {
                        
                        print(String(describing: registrationError?.localizedDescription))
                    }
                    
                    
                })
            }
        }
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}


extension LoginVC: UITextFieldDelegate {
    
    
    
    
}
