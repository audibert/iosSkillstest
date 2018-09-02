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
    
    // Recebe todos os usuários registrados
    var registeredUsers: [User]?
    // Recebe todos os usuários com o filtro
    var currentDisplayedUsers = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var welcomeLbl: UILabel!
    
    var userLoggedIn: User? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.setupSearchBar()
        
        self.navigationItem.setHidesBackButton(true, animated:true);

        if let user = userLoggedIn {
            welcomeLbl.text = "Bem vindo, \(user.name!)"
        }
        
        // Faz a requisição dos usuários para o Core Data
        fetchUsers()
        
        
    }

    /**
     * Função que faz a requisição dos usuários cadastrados no Core Data
     */
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
        
        cell!.setupCell(user: currentDisplayedUsers[indexPath.row])
        
        
        return cell!
    }
    
    
    //MARK:- Métodos do SearchBar
    
    func setupSearchBar() {
        searchBar.delegate = self
        // Faz o background color do searchbar ficar transparente
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }
    
    
    /**
     * Função que é executada quando o usuário digita algo na search bar
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let users = registeredUsers {
            
            guard !searchText.isEmpty else {
                currentDisplayedUsers = users
                tableView.reloadData()
                return
                
            }
            currentDisplayedUsers = users.filter({ (user) -> Bool in
                 user.name!.lowercased().contains(searchText.lowercased()) || user.email!.lowercased().contains(searchText.lowercased())
            })
            tableView.reloadData()
            
        }
    }
    
    //MARK:- Prepare for Segue
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SignUpViewController
        {
            let vc = segue.destination as? SignUpViewController
            vc?.shouldRemoveBackButton = true
        }
    }
    

}


