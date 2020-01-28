//
//  DBManager.swift
//  CoreDataDemo
//
//  Created by D2V iMac on 28/01/20.
//  Copyright © 2020 D2V iMac. All rights reserved.
//

import Foundation
import CoreData


class DBManager{

// MARK: - Core Data stack
    
    static var sharedManager = DBManager()

lazy var persistentContainer: NSPersistentContainer = {

    let container = NSPersistentContainer(name: "CoreDataDemo")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
       
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

// MARK: - Core Data Saving support


    lazy var context = persistentContainer.viewContext
            
        func saveContext () {
           
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    
    func fetchSchoolContext() -> [School] {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: School.description())
        
        do {
            if let data = try context.fetch(request) as? [School] {
                return data
            }
        }catch{
            print("Error")
        }
         return []
        
    }
    
    func fetchStudentContext() -> [Student] {
          
          let request = NSFetchRequest<NSFetchRequestResult>(entityName: Student.description())
          
          do {
              if let data = try context.fetch(request) as? [Student] {
                  return data
              }
          }catch{
              print("Error")
          }
           return []
          
      }

// using direct entity
    func fetchContext(entity: NSManagedObject.Type) -> [NSManagedObject] {

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity.description())

        do {
            if let data = try context.fetch(request) as? [NSManagedObject] {
                return data
            }
        }catch{
            print("Error")
        }
          return []
    }
   //using ns predicate
    func fetchPredicate(entity: NSManagedObject.Type, compareStr: String, predicate: String) -> [NSManagedObject] {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity.description())
        request.predicate = NSPredicate.init(format: "%K = %@", compareStr, predicate)
        do {
            if let data = try context.fetch(request) as? [NSManagedObject] {
                return data
            }
        }catch{
            print("Error")
        }
          return []
    }
}
