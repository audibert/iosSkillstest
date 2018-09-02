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
        
        if emailTextField.text! == "" {
            emailErrorLbl.text = "E-mail é obrigatório"
            emailErrorLbl.isHidden = false
        }
        
        if passwordTextField.text! == "" {
            passwordErrorLbl.text = "Senha é obrigatório"
            passwordErrorLbl.isHidden = false
        }
        
        
    }
    
}



//extension UIViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//        cell.textLabel?.text = ""
//        cell.detailTextLabel?.text = ""
//    }
//}
