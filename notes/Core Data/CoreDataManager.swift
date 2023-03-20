//
//  CoreDataManager.swift
//  notes
//
//  Created by pvl kzntsv on 19.03.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(modelName: "note")
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    let persistentContainer: NSPersistentContainer
//    let persistentContainer = NSPersistentContainer(name: "note")
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    func fetchData() -> [Note] {
        let request = Note.fetchRequest()
        let sortDescriptor = NSSortDescriptor(keyPath: \Note.title, ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return try! context.fetch(request)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }
    
    func save() {
        do {
            try context.save()
        }
        catch let err {
            print(err.localizedDescription)
        }
    }
    
    func delete(_ note: Note) {
        context.delete(note)
    }
    
    
    
    
}
