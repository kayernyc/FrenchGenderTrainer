//
//  CoreDataStack.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 12/28/19.
//  Copyright © 2019 happierplaces. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack: NSObject {
  static let sharedInstance = CoreDataStack()

  private override init() {}

  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "FrenchNouns")
    container.loadPersistentStores { _, error in
      if let error = error {
        fatalError("Unable to load persistent stores: \(error)")
      }
    }

    let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let DBurl = documentURL.appendingPathComponent("FrenchNouns.sqlite")

    if !FileManager.default.fileExists(atPath: DBurl.path) {
      let sourceSqliteURLs = [Bundle.main.url(forResource: "FrenchNouns", withExtension: "sqlite")!,
                              Bundle.main.url(forResource: "FrenchNouns", withExtension: "sqlite-wal")!,
                              Bundle.main.url(forResource: "FrenchNouns", withExtension: "sqlite-shm")!]

        let destSqliteURLs = [documentURL.appendingPathComponent("FrenchNouns.sqlite"),
            documentURL.appendingPathComponent("FrenchNouns.sqlite-wal"),
            documentURL.appendingPathComponent("FrenchNouns.sqlite-shm")]

        var error:NSError?

      for (index, element) in sourceSqliteURLs.enumerated() {
        do {
          try FileManager.default.copyItem(at: sourceSqliteURLs[index], to: destSqliteURLs[index])
        } catch {
          print("ERROR: \(error)")
        }
      }
    }

    return container
  }()

  func saveContext () {
      let context = persistentContainer.viewContext
      if context.hasChanges {
          do {
              try context.save()
          } catch {
              let nserror = error as NSError
              fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
      }
  }

}

// MARK: - Convenience Methods
extension CoreDataStack {
  func applicationDocumentsDirectory() {
      if let DBurl = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last {
          print(DBurl.absoluteString)
      }
  }
}
