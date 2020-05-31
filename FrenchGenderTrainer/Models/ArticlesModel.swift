//
//  ArticlesModel.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 2/22/20.
//  Copyright © 2020 happierplaces. All rights reserved.
//

import Foundation

class ArticlesModel {
  private let vowles = ["a", "à", "â", "æ", "e", "è", "é", "ê", "ë", "î", "ï", "i","ì",
                        "ô", "o","ò", "œ", "û", "ù", "ü", "u",
                        "A", "À", "Â", "Æ", "E", "È", "É", "Ê", "Ë", "I", "Î", "Ï",
                        "Ì", "O", "Ô", "Ò", "Œ", "U", "Ù", "Û", "Ü"]

  private let aspiratedH = ["hôte", "héros", "haut-parleur", "hausse",
                            "hauteur", "honte", "hanche", "hiérarchie", "haut"]

  func findFrenchArticle(word: String, firstLetter: String, gender: Int) -> String {
    if ((firstLetter == "H" || firstLetter == "h")
      && aspiratedH.contains(word)) || vowles.contains(firstLetter) {
      return "l'"
    }

    return gender == 0 ? "le " : "la "
  }

  func findEnglishArticle(firstLetter: String) -> String {
    return "the "
  }

  func findArticle(for word: String, inFrench: Bool, gender: Int) -> String {
    let firstLetter = String(word.first!)

    if inFrench {
      return findFrenchArticle(word: word, firstLetter: firstLetter, gender: gender)
    } else {
      return findEnglishArticle(firstLetter: firstLetter)
    }
  }
}
