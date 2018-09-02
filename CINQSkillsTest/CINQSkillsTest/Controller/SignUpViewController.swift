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
    var shouldRemoveBackButton = false
    
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
        
        if shouldRemoveBackButton {
            self.navigationItem.setHidesBackButton(true, animated:true);
        }
        

    }
    
    @IBAction func signUpTapped(_ sender: Any) {
    
        resetErrors()
        
        var numOfErrors = 0
        if nameTextField.text! == "" {
            nameErrorLbl.isHidden = false
            nameErrorLbl.text = Constants.NAME_EMPTY_ERROR
            numOfErrors += 1
        }
        if emailTextField.text! == "" {
            emailErrorLbl.isHidden = false
            emailErrorLbl.text = Constants.EMAIL_EMPTY_ERROR
            numOfErrors += 1
        }
        if passwordTextField.text! == "" {
            passwordErrorLbl.isHidden = false
            passwordErrorLbl.text = Constants.PASSWORD_EMPTY_ERROR
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
            
        } else {
            
        }
        
    }
    
    func resetErrors() {
        
        nameErrorLbl.isHidden = true
        emailErrorLbl.isHidden = true
        passwordErrorLbl.isHidden = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MainViewController
        {
            let vc = segue.destination as? MainViewController
            vc?.userLoggedIn = userForSegue
        }
    }

    
    
}
