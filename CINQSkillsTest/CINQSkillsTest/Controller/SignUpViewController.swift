//
//  SignUpViewController.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/1/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {

    var userForSegue : User? = nil
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameErrorLbl: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLbl: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.makeNavigationTransparent(vc: self)
        nameErrorLbl.isHidden = true
        emailErrorLbl.isHidden = true
        passwordErrorLbl.isHidden = true
        

    }
    
    @IBAction func signUpTapped(_ sender: Any) {
    
        var numOfErrors = 0
        if nameTextField.text! == "" {
            nameErrorLbl.isHidden = false
            numOfErrors += 1
        }
        if emailTextField.text! == "" {
            emailErrorLbl.isHidden = false
            numOfErrors += 1
        }
        if passwordTextField.text! == "" {
            passwordErrorLbl.isHidden = false
            numOfErrors += 1
        }
        
        if numOfErrors == 0 {
            let name = nameTextField.text!
            let email = emailTextField.text!
            let password = passwordTextField.text!
            if !UsersFactory.instance.userExists(email: email) {
                userForSegue = UsersFactory.instance.saveNewUser(name: name, email: email, password: password)
                self.performSegue(withIdentifier: "signUpToMain", sender: self)
            } else {
                emailErrorLbl.text = "Usuário já cadastrado"
                emailErrorLbl.isHidden = false
            }
            
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MainViewController
        {
            let vc = segue.destination as? MainViewController
            vc?.userLoggedIn = userForSegue
        }
    }

    
    
}
