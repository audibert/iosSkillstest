//
//  MainViewController.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/2/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

    
    @IBOutlet weak var welcomeLbl: UILabel!
    
    var userLoggedIn: User? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userLoggedIn!.email!)
        self.navigationItem.setHidesBackButton(true, animated:true);

        if let user = userLoggedIn {
        welcomeLbl.text = "Bem vindo, \(user.name!)"
        }
        
    }


}

//
//let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
//do {
//    let users = try PersistenceService.context.fetch(fetchRequest)
//    for user in users {
//        print("\(String(describing: user.email)) || \(String(describing: user.password))")
//    }
//} catch{
//    print(error)
//}
