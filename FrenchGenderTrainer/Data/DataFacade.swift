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
  private let rulesStruct = GenderRulesStruct()

  private let defaultPredicate: NSPredicate
  private let rulesCount: Int

  init() {
    rulesCount = rulesStruct.allRulesCount()
    defaultPredicate = NSPredicate(format: "genderRuleKey IN %@", Array(0...rulesCount))
  }
}

// MARK: - READ
extension DataFacade {
  // prepare for overloading if needed
  func getRecords(fetchLimit: Int? , predicate: NSPredicate?) -> [FrenchWord] {
    let predicate = predicate ?? self.defaultPredicate
    let context = dictionaryFactory.managedContext

    let wordFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "FrenchWord")

    if fetchLimit != nil {
      wordFetch.fetchLimit = fetchLimit!
    }

    wordFetch.returnsObjectsAsFaults = false
    wordFetch.predicate = predicate

    do {
      // swiftlint:disable force_cast
      let words = try context.fetch(wordFetch) as! [FrenchWord]
      // swiftlint:enable force_cast
      return words
    } catch {
      print("ERROR: \(error)")
    }
    return [FrenchWord]()
  }
}
