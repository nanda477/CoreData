//
//  School+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by D2V iMac on 28/01/20.
//  Copyright © 2020 D2V iMac. All rights reserved.
//
//

import Foundation
import CoreData


extension School {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<School> {
        return NSFetchRequest<School>(entityName: "School")
    }

    @NSManaged public var address: String?
    @NSManaged public var estd: Int16
    @NSManaged public var name: String?
    @NSManaged public var many: NSSet?

}

// MARK: Generated accessors for many
extension School {

    @objc(addManyObject:)
    @NSManaged public func addToMany(_ value: Student)

    @objc(removeManyObject:)
    @NSManaged public func removeFromMany(_ value: Student)

    @objc(addMany:)
    @NSManaged public func addToMany(_ values: NSSet)

    @objc(removeMany:)
    @NSManaged public func removeFromMany(_ values: NSSet)

}
