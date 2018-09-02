//
//  MainViewController.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/2/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var registeredUsers: [User]?
    
    var currentDisplayedUsers = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var welcomeLbl: UILabel!
    
    var userLoggedIn: User? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(String(describing: userLoggedIn))")
        print(userLoggedIn!.email!)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.setupSearchBar()
        
        self.navigationItem.setHidesBackButton(true, animated:true);

        if let user = userLoggedIn {
        welcomeLbl.text = "Bem vindo, \(user.name!)"
        }
        
        
        fetchUsers()
        
        
    }

    private func fetchUsers() {
        registeredUsers = UsersFactory.instance.fetchAllusers()
        
        if registeredUsers != nil {
            currentDisplayedUsers = registeredUsers!
            tableView.reloadData()
            
        }
    }
    
    
    //MARK:- Métodos do TableViewDataSource e TableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDisplayedUsers.count
        //return registeredUsers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "registeredUsersCell", for: indexPath) as? RegisteredUsersTableViewCell
        
        //if let users = registeredUsers {
        cell!.setupCell(user: currentDisplayedUsers[indexPath.row])
        //}
        
        return cell!
    }
    
    
    //MARK:- Métodos do SearchBar
    
    func setupSearchBar() {
        self.searchBar.delegate = self
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let users = registeredUsers {
            
            guard !searchText.isEmpty else {
                currentDisplayedUsers = users
                tableView.reloadData()
                return
                
            }
            
            currentDisplayedUsers = users.filter({ (user) -> Bool in
               // guard let text = searchBar.text else { return false }
                 user.name!.lowercased().contains(searchText.lowercased()) //|| user.email!.contains(searchText)
            })
            tableView.reloadData()
            
        }
    }
    
    
    

}


