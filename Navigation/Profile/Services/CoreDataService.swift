//
//  CoreDataService.swift
//  Navigation
//
//  Created by Apple Mac Air on 20.03.2024.
//

import CoreData

protocol ICoreDataService {
    var context: NSManagedObjectContext { get }
    func saveContext()
}

final class CoreDataService: ICoreDataService {
    
    static let shared: ICoreDataService = CoreDataService()
    
    private init() {}
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: .coreDataBaseName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print(error)
                assertionFailure("load Persistent Stores error")
            }
        }
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error)
                assertionFailure("Save error")
            }
        }
    }
}

private extension String {
    static let coreDataBaseName = "CoreDataModel"
}
