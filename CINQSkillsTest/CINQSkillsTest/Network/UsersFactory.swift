//
//  UsersFactory.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/2/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//

import Foundation
import CoreData

class UsersFactory {
    
    static let instance = UsersFactory()
    
    private init() {
    }
    
    /**
     * Função que salva o novo usuário no Core Data
     */
    public func saveNewUser(name: String, email: String, password: String) -> User{
        let user = User(context: PersistenceService.context)
        user.name = name
        user.email = email
        user.password = password
        PersistenceService.saveContext()
        return user
    }
    
    /**
     * Pega todos os usuários do Core Data
     */
    public func fetchAllusers() -> [User]? {
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let users = try PersistenceService.context.fetch(fetchRequest)
            return users
        } catch{
            print(error)
            return nil
        }
        
    }
    
    public func retrieveUser(email: String) -> User? {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let predicate = NSPredicate(format: "email == %@", email)
        fetchRequest.predicate = predicate
        do {
            let fetchResults = try PersistenceService.context.fetch(fetchRequest) as? [User]
            if fetchResults!.count > 0 {
                for user in fetchResults! {
                    if user.email == email {
                        return user
                        
                    }
                }
            } else {
                return nil
            }
        } catch {
            print(error)
            return nil
        }
        return nil
    }
    
    public func userExists(email: String) -> Bool {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let predicate = NSPredicate(format: "email == %@", email)
        fetchRequest.predicate = predicate
        do {
            let fetchResults = try PersistenceService.context.fetch(fetchRequest) as? [User]
            if fetchResults!.count > 0 {
                return true
            } else {
                return false
            }
        } catch {
            print(error)
            return false
        }
        
    }
    
    
    
}
