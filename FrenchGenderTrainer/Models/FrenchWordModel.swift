//
//  FrenchWordModel.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 3/9/19.
//  Copyright © 2019 happierplaces. All rights reserved.
//

import Foundation

class FrenchWordModel {
//  let dictionary = DictionaryFactory()
  private let dataFacade = DataFacade()

  func rule(for word: FrenchWord) -> GenderRuleAndException {
    let ruleIndex = Int(word.genderRuleKey)
    return dataFacade.rule(by: ruleIndex)
  }

  func newWord() -> FrenchWord? {
    // TODO: dataFacade.getRecords should be able to throw
    // TODO: if dataFacade fails, retry
    let frenchWord = dataFacade.getRandomRecords(fetchLimit: 1, predicate: nil)[0]
    if frenchWord == nil {
      print("error")
      return nil
    }

    return frenchWord
  }

  init() {

  }
}
