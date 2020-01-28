//
//  Student+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by D2V iMac on 28/01/20.
//  Copyright © 2020 D2V iMac. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var phno: Int16
    @NSManaged public var rollno: Int16
    @NSManaged public var single: School?

}
