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
  private struct FrenchDataRecord {
    
  }

  private func createData(dataStrings: [String]) {

    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext

    for frenchWordRecord in dataStrings {
      print("\n\(frenchWordRecord)\n")
    }

    //let userEntity = NSEntityDescription.entity(forEntityName: "FrenchWord", in: managedContext)

  }

  func processDictionary() {
    let filepath = Bundle.main.path(forResource: "dictionary", ofType: "txt")
    let URL = NSURL.fileURL(withPath: filepath!)

    do {
      let string = try String.init(contentsOf: URL)

      let lines = string.components(separatedBy: "\n")
      print("lines count: \(lines.count)")
      createData(dataStrings: lines)

      //print("read: \(string)")
    } catch {
      print(error)
    }
  }
}
