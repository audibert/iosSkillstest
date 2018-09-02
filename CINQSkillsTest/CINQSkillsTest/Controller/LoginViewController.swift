//
//  ViewController.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/1/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//

import UIKit
import SQLite3

class LoginViewController: UIViewController {

    var userToSegue: User? = nil
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLbl: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.makeNavigationTransparent(vc: self)
        emailErrorLbl.isHidden = true
        passwordErrorLbl.isHidden = true
    }


    @IBAction func loginTapped(_ sender: Any) {


        var numErrors = 0
        
        if emailTextField.text! == "" {
            emailErrorLbl.text = Constants.EMAIL_EMPTY_ERROR
            emailErrorLbl.isHidden = false
            numErrors += 1
        }
        
        if passwordTextField.text! == "" {
            passwordErrorLbl.text = Constants.PASSWORD_EMPTY_ERROR
            passwordErrorLbl.isHidden = false
            numErrors += 1
            
        }
    
        if numErrors > 0 {
            
           // resetFields()
            return
        }
        
        if UsersFactory.instance.userExists(email: emailTextField.text!) {
            let user = UsersFactory.instance.retrieveUser(email: emailTextField.text!)
            
            if let user = user {
                
                if user.password == passwordTextField.text! {
                    userToSegue = user
                    self.performSegue(withIdentifier: "loginToMain", sender: self)
                } else {
                    passwordErrorLbl.text = Constants.WRONG_PASSWORD
                    passwordErrorLbl.isHidden = false
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is MainViewController {
            let vc = segue.destination as? MainViewController
            vc?.userLoggedIn = userToSegue
        }
    }
    
    func resetFields() {
        
        emailTextField.text = ""
        emailErrorLbl.isHidden = true
        passwordTextField.text = ""
        passwordErrorLbl.isHidden = true
        
        
    }
    
}


