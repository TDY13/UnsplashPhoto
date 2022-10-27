//
//  CoreDataManager.swift
//  UnsplashPhoto
//
//  Created by DiOS on 23.10.2022.
//

import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "UnsplashPhoto")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
//MARK: - Create obj
extension CoreDataManager {
    func createObject(_ image: UIImage, authorImage: UIImage, authorName: String, id: String, likes: Int, publicationDate: String) -> FavouritesPhoto {
        let object = FavouritesPhoto(context: persistentContainer.viewContext)
        object.photo = image.pngData()
        object.authorPhoto = authorImage.pngData()
        object.authorName = authorName
        object.id = id
        object.likes = Int64(likes)
        object.publicationDate = publicationDate
        return object
    }
}
//MARK: - Get obj
extension CoreDataManager {
    func getObjectWith(id: String) -> FavouritesPhoto? {
        
        let fetchRequest = NSFetchRequest<FavouritesPhoto>(entityName: "FavouritesPhoto")
        let predicate = NSPredicate(format: "id == %@", id)
        fetchRequest.predicate = predicate
        do {
            let objects = try persistentContainer.viewContext.fetch(fetchRequest)
            if let obj = objects.first {
                return obj
            } else {
                return nil
            }
        } catch {
            fatalError("❌\(error)❌")
        }
    }
    
    func getAllObjects() -> [FavouritesPhoto] {
        
        let fetchRequest = NSFetchRequest<FavouritesPhoto>(entityName: "FavouritesPhoto")
        do {
            let objects = try persistentContainer.viewContext.fetch(fetchRequest)
            return objects
        } catch {
            fatalError("❌\(error)❌")
        }
    }
}
//MARK: - Delete obj
extension CoreDataManager {
    func delete(object: FavouritesPhoto) {
        persistentContainer.viewContext.delete(object)
        saveContext()
    }
}
