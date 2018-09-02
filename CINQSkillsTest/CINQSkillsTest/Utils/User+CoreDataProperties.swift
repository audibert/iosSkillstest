//
//  User+CoreDataProperties.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/2/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}
