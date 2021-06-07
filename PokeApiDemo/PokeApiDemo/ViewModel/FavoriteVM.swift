//
//  FavoriteVM.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 6/06/21.
//

import Foundation
import CoreData
import SwiftUI
import UIKit


class FavoriteVM: ObservableObject {
    @Published var pokemonList: [Pokemon] = []
    var managedObjects: [NSManagedObject] = []
    var manager: [NSManagedObject] = []
    init() {
        self.getFavorite()
    }

    func getFavorite() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorite")
        
        do {
            managedObjects = try managedContext.fetch(fetchRequest)
        } catch let error {
            print("Failure: \(error)")
        }
        
        for obj in managedObjects {
            if managedObjects.count > 1 {
                let name = obj.value(forKey: "name") as? String
                
                if let nameValidate = name {
                    self.manager.append(obj)
                    print(nameValidate)
                }
            }
        }
    }
    
    func addFavorite(name: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Favorite", in: managedContext)
        
        let managedObject = NSManagedObject(entity: entity ?? NSEntityDescription(), insertInto: managedContext)
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        
        request.predicate = NSPredicate(format: "name = %@", name)
        
        
        
        do {
            let fetch = try managedContext.fetch(request)
            if fetch.count == 0 {
                managedObject.setValue(name, forKeyPath: "name")
                do {
                    try managedContext.save()
                } catch {
                    print(error)
                }
            }
            
        } catch let error {
            print("Failure: \(error)")
        }
        
    }
    
    func deleteFavorite(name: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        
        request.predicate = NSPredicate(format: "name = %@", name)
        
        
        do {
            let fetch = try managedContext.fetch(request)
            if fetch.count > 0 {
                let objectToDelete = fetch[0] as! NSManagedObject
                managedContext.delete(objectToDelete)
                do {
                    try managedContext.save()
                } catch {
                    print(error)
                }
            }
            
        } catch {
            print("Failure: \(error)")
        }
        
    }
    
}
