//
//  DataFacade.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 12/30/19.
//  Copyright © 2019 happierplaces. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataFacade {
  private let dictionaryFactory = DictionaryFactory.sharedInstance
}

// MARK: - READ
extension DataFacade {
  func getRecords(fetchLimit: Int) -> [FrenchWord] {
    let context = dictionaryFactory.managedContext

    let wordFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "FrenchWord")
    wordFetch.fetchLimit = 1
    wordFetch.returnsObjectsAsFaults = false
    wordFetch.predicate = NSPredicate(format: "french = %@", "chou")

    do {
      // swiftlint:disable force_cast
      let words = try context.fetch(wordFetch) as! [FrenchWord]
      // swiftlint:enable force_cast
      print(words)
      return words
    } catch {
      print("ERROR: \(error)")
    }
    return [FrenchWord]()
  }
}
