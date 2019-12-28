//
//  DictionaryFactory.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 3/31/19.
//  Copyright © 2019 happierplaces. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DictionaryFactory {
  private let managedContext: NSManagedObjectContext
  private let entity: NSEntityDescription

  init() {
    managedContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
    entity = NSEntityDescription.entity(forEntityName: "FrenchWord", in: managedContext)!
  }
}

// MARK: - French Record building functions
extension DictionaryFactory {
  // Open this in the future
  private func createFrenchWordFrom(dictionary: [String: AnyObject]) {
    if let frenchWordEntity = NSEntityDescription.insertNewObject(forEntityName: "FrenchWord",
                                                                  into: managedContext) as? FrenchWord {
      // swiftlint:disable force_cast
      frenchWordEntity.english = (dictionary["english"] as! String)
      frenchWordEntity.french = (dictionary["french"] as! String)
      frenchWordEntity.gender = dictionary["gender"] as! Int16
      frenchWordEntity.genderRuleKey = dictionary["genderRuleKey"] as! Int64
      frenchWordEntity.exception = dictionary["exception"] as! Bool
      frenchWordEntity.version = 1
      frenchWordEntity.wordKey = UUID()
      // swiftlint:enable force_cast

      do {
        try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
      } catch let error {
        print(error)
      }
    }
  }

  private func processDictionary() {
    // build function for initial file.
    if let filepath = Bundle.main.url(forResource: "french-nouns", withExtension: "json") {
      do {
        let data = try Data(contentsOf: filepath)
        guard let json = try? JSONSerialization.jsonObject(with: data) as? NSArray else { return }
        for line in json {
          guard let dictRawFrenchRecord = line as? [String: AnyObject] else {
            continue
          }
          createFrenchWordFrom(dictionary: dictRawFrenchRecord)
        }
      } catch {
        print(error)
      }
    } else {
      print("NOT FOUND")
    }
  }
}
