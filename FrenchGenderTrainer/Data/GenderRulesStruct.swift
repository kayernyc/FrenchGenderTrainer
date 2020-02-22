//
//  GenderRulesStruct.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 3/7/19.
//  Copyright © 2019 happierplaces. All rights reserved.
//

import Foundation

struct GenderRuleAndException {
  let key: Int
  let gender: Int
  let rule: String
  let exceptions: [String]?
  let matches: [String]?

  func explainationMessage(word: FrenchWord) -> String {
    guard let frenchWord = word.french, !word.french!.isEmpty else {
      return ""
    }

    var explaination: String
    if (rule.contains(" ")) {
      // is a conceptual rule
      explaination = rule
    } else {
      // is a pattern
      explaination =
      """
      Words ending in \"\(rule)\" are usually
      \(gender == 0 ? "masculine" : "feminine").
      """
    }

    let frenchWordCapped = frenchWord.capitalized

    if Int(word.gender) == gender {
      explaination += """
       \(frenchWordCapped) is \(gender == 0 ?
      "masculine" : "feminine") and follows the pattern.
      """
    } else {
      explaination += " \(frenchWordCapped) is an exception."
    }

    return explaination
  }
}

// swiftlint:disable line_length
struct GenderRulesStruct {
  func allRulesCount() -> Int {
    return self.rulesCollection.count
  }

  func getRuleByIndex(index: Int) -> GenderRuleAndException {
    return rulesCollection[index]
  }

  let rulesCollection = [
    GenderRuleAndException(key: 0, gender: 0, rule: "phone", exceptions: [], matches: []),
    GenderRuleAndException(key: 1, gender: 1, rule: "ence", exceptions: ["silence"], matches: []),
    GenderRuleAndException(key: 2, gender: 1, rule: "euse", exceptions: [], matches: []),
    GenderRuleAndException(key: 3, gender: 1, rule: "ance", exceptions: [], matches: []),
    GenderRuleAndException(key: 4, gender: 1, rule: "esse", exceptions: [], matches: []),
    GenderRuleAndException(key: 5, gender: 1, rule: "ique", exceptions: ["graphique", "périphérique", "plastique", "moustique"], matches: []),
    GenderRuleAndException(key: 6, gender: 1, rule: "ière", exceptions: ["arrière", "cimetière", "derrière"], matches: []),
    GenderRuleAndException(key: 7, gender: 1, rule: "erie", exceptions: [], matches: []),
    GenderRuleAndException(key: 8, gender: 0, rule: "ueil", exceptions: [], matches: []),
    GenderRuleAndException(key: 9, gender: 0, rule: "isme", exceptions: [], matches: []),
    GenderRuleAndException(key: 10, gender: 0, rule: "ment", exceptions: ["jument"], matches: []),
    GenderRuleAndException(key: 11, gender: 1, rule: "rice", exceptions: ["dentifrice"], matches: []),
    GenderRuleAndException(key: 12, gender: 0, rule: "cide", exceptions: [], matches: []),
    GenderRuleAndException(key: 13, gender: 0, rule: "tre", exceptions: ["fenêtre", "huître", "lettre", "montre", "rencontre", "vitre"], matches: []),
    GenderRuleAndException(key: 14, gender: 0, rule: "ège", exceptions: [], matches: []),
    GenderRuleAndException(key: 15, gender: 0, rule: "ard", exceptions: [], matches: []),
    GenderRuleAndException(key: 16, gender: 0, rule: "age", exceptions: ["cage", "image", "nage", "page", "plage", "rage"], matches: []),
    GenderRuleAndException(key: 17, gender: 0, rule: "ble", exceptions: ["cible", "étable", "fable", "table"], matches: []),
    GenderRuleAndException(key: 18, gender: 0, rule: "cle", exceptions: ["boucle"], matches: []),
    GenderRuleAndException(key: 19, gender: 0, rule: "ing", exceptions: [], matches: []),
    GenderRuleAndException(key: 20, gender: 0, rule: "ste", exceptions: ["liste", "modiste", "piste"], matches: []),
    GenderRuleAndException(key: 21, gender: 0, rule: "one", exceptions: [], matches: []),
    GenderRuleAndException(key: 22, gender: 0, rule: "ope", exceptions: [], matches: []),
    GenderRuleAndException(key: 23, gender: 0, rule: "oir", exceptions: [], matches: []),
    GenderRuleAndException(key: 24, gender: 0, rule: "ail", exceptions: [], matches: []),
    GenderRuleAndException(key: 25, gender: 0, rule: "eil", exceptions: [], matches: []),
    GenderRuleAndException(key: 26, gender: 0, rule: "eau", exceptions: ["eau", "peau"], matches: []),
    GenderRuleAndException(key: 27, gender: 0, rule: "ème", exceptions: [], matches: []),
    GenderRuleAndException(key: 28, gender: 1, rule: "ère", exceptions: ["père", "frère"], matches: []),
    GenderRuleAndException(key: 29, gender: 1, rule: "son", exceptions: ["blouson"], matches: []),
    GenderRuleAndException(key: 30, gender: 1, rule: "tié", exceptions: [], matches: []),
    GenderRuleAndException(key: 31, gender: 1, rule: "ude", exceptions: ["coude", "interlude", "prélude"], matches: []),
    GenderRuleAndException(key: 32, gender: 1, rule: "ule", exceptions: ["préambule", "scrupule", "tentacule", "testicule", "véhicule", "ventricule", "vestibule"], matches: []),
    GenderRuleAndException(key: 33, gender: 1, rule: "ure", exceptions: ["centaure", "cyanure", "dinosaure", "murmure"], matches: []),
    GenderRuleAndException(key: 34, gender: 1, rule: "ace", exceptions: ["ace", "palace"], matches: []),
    GenderRuleAndException(key: 35, gender: 1, rule: "ade", exceptions: ["grade", "jade", "stade"], matches: []),
    GenderRuleAndException(key: 36, gender: 1, rule: "ale", exceptions: ["châle", "pétale", "scandale"], matches: []),
    GenderRuleAndException(key: 37, gender: 1, rule: "ine", exceptions: ["capitaine", "domaine", "moine", "magazine", "patrimoine"], matches: []),
    GenderRuleAndException(key: 38, gender: 1, rule: "ion", exceptions: ["avion", "bastion", "billion", "camion", "cation", "dominion", "espion", "ion", "lampion", "lion", "million", "morpion", "pion", "scion", "scorpion", "trillion"], matches: []),
    GenderRuleAndException(key: 39, gender: 1, rule: "ire", exceptions: ["auditoire", "commentaire", "dictionnaire", "directoire", "horaire", "itinéraire", "ivoire", "laboratoire", "navire", "pourboire", "purgatoire", "répertoire", "salaire", "sommaire", "sourire", "territoire", "vocabulaire"], matches: []),
    GenderRuleAndException(key: 40, gender: 1, rule: "ise", exceptions: [], matches: []),
    GenderRuleAndException(key: 41, gender: 1, rule: "ite", exceptions: ["anthracite", "ermite", "granite", "graphite", "mérite", "opposite", "plébiscite", "rite", "satellite", "site", "termite"], matches: []),
    GenderRuleAndException(key: 42, gender: 1, rule: "lle", exceptions: ["braille", "gorille", "intervalle", "mille", "portefeuille", "vaudeville", "vermicelle", "violoncelle"], matches: []),
    GenderRuleAndException(key: 43, gender: 1, rule: "mme", exceptions: ["dilemme", "gramme", "programme"], matches: []),
    GenderRuleAndException(key: 44, gender: 1, rule: "nde", exceptions: ["monde"], matches: []),
    GenderRuleAndException(key: 45, gender: 1, rule: "nne", exceptions: [], matches: []),
    GenderRuleAndException(key: 46, gender: 1, rule: "ole", exceptions: ["contrôle", "monopole", "rôle", "symbole"], matches: []),
    GenderRuleAndException(key: 47, gender: 1, rule: "rre", exceptions: ["beurre", "parterre", "tonnerre", "verre"], matches: []),
    GenderRuleAndException(key: 48, gender: 0, rule: "de", exceptions: ["bride", "merde", "méthode", "pinède", "ade, -nde, -ude endings"], matches: []),
    GenderRuleAndException(key: 49, gender: 1, rule: "ée", exceptions: ["lycée", "musée"], matches: []),
    GenderRuleAndException(key: 50, gender: 0, rule: "et ", exceptions: [], matches: []),
    GenderRuleAndException(key: 51, gender: 0, rule: "ot", exceptions: [], matches: []),
    GenderRuleAndException(key: 52, gender: 0, rule: "at", exceptions: [], matches: []),
    GenderRuleAndException(key: 53, gender: 0, rule: "il", exceptions: [], matches: []),
    GenderRuleAndException(key: 54, gender: 0, rule: "me", exceptions: ["alarme", "âme", "arme", "cime", "coutume", "crème", "écume", "énigme", "estime", "ferme", "firme", "forme", "larme", "plume", "rame", "rime"], matches: []),
    GenderRuleAndException(key: 55, gender: 0, rule: "ou", exceptions: [], matches: []),
    GenderRuleAndException(key: 56, gender: 1, rule: "be", exceptions: ["cube", "globe", "microbe", "tube", "verbe"], matches: []),
    GenderRuleAndException(key: 57, gender: 1, rule: "ce", exceptions: ["artifice", "armistice", "appendice", "bénéfice", "caprice", "commerce", "dentifrice", "divorce", "exercice", "office", "orifice", "précipice", "prince", "sacrifice", "service", "silence", "solstice", "supplice", "vice"], matches: []),
    GenderRuleAndException(key: 58, gender: 1, rule: "cé", exceptions: ["crustacé"], matches: []),
    GenderRuleAndException(key: 59, gender: 1, rule: "ee", exceptions: ["pedigree"], matches: []),
    GenderRuleAndException(key: 60, gender: 1, rule: "ée", exceptions: ["apogée", "lycée", "musée", "périgée", "trophée"], matches: []),
    GenderRuleAndException(key: 61, gender: 1, rule: "fe", exceptions: ["golfe"], matches: []),
    GenderRuleAndException(key: 62, gender: 1, rule: "ie", exceptions: ["incendie", "foie", "génie", "parapluie", "sosie"], matches: []),
    GenderRuleAndException(key: 63, gender: 1, rule: "se", exceptions: ["carosse", "colosse", "gypse", "inverse", "malaise", "pamplemousse", "parebrise", "suspense"], matches: []),
    GenderRuleAndException(key: 64, gender: 1, rule: "sé", exceptions: ["exposé", "opposé"], matches: []),
    GenderRuleAndException(key: 65, gender: 1, rule: "té", exceptions: ["arrêté", "comité", "comté", "côté", "député", "été", "pâté", "traité"], matches: []),
    GenderRuleAndException(key: 66, gender: 1, rule: "ue", exceptions: ["abaque"], matches: []),
    GenderRuleAndException(key: 67, gender: 1, rule: "e", exceptions: ["peuple"], matches: []),
    GenderRuleAndException(key: 68, gender: 0, rule: "o", exceptions: ["dactylo", "dynamo", "libido", "radio"], matches: []), //most of these are apocopes of longer feminine wor)s
    GenderRuleAndException(key: 69, gender: 0, rule: "i", exceptions: ["foi", "fourmi", "loi", "paroi", "merci"], matches: []),
    GenderRuleAndException(key: 70, gender: 0, rule: "é", exceptions: ["clé", "psyché", "sé, té, and tié endings"], matches: []),
    GenderRuleAndException(key: 71, gender: 0, rule: "u", exceptions: ["tribu", "vertu"], matches: []),
    GenderRuleAndException(key: 72, gender: 0, rule: "a", exceptions: ["cafétéria", "pizza" ], matches: []),
    GenderRuleAndException(key: 73, gender: 0, rule: "Words ending in consonants (in the spelling) are usually masculine.", exceptions: ["mob", "pub", "alloc", "collec", "doc", "embroc", "fac", "réduc", "soif", "clef", "nef", "façon", "fin", "leçon", "main", "maman", "rançon", "chair", "cour", "cuiller", "mer", "tour", "brebis", "fois", "oasis", "souris", "vis", "burlat", "dent", "dot", "forêt", "mort", "nuit", "part", "plupart", "ziggourat", "roseval", "faim", "croix", "noix", "paix", "toux", "voix"], matches: ["b", "c", "d", "f", "l", "m", "n", "p", "r", "s", "t", "x"]),
    GenderRuleAndException(key: 74, gender: 0, rule: "Words ending in other consonants (in the spelling).", exceptions: [], matches: ["nez", "étang", "sang", "rang"]),
    GenderRuleAndException(key: 75, gender: 0, rule: "Certain nouns referring to animals that can refer to only the male of the species are masculine. For example: étalon (stallion), cerf (stag), matou (tomcat).", exceptions: [], matches: ["étalon", "stag", "matou"]),
    GenderRuleAndException(key: 76, gender: 0, rule: "Masculine nouns that are \"generic\" terms and can refer to either a male or female of the species. For example, le cheval can refer to either a male or female horse.", exceptions: [],matches: ["cheval"]),
    GenderRuleAndException(key: 77, gender: 0, rule: "Names of towns or other place names (departments, rivers, countries) not ending in -e. Sometimes town names, especially if they look or sound feminine can be treated as feminine.", exceptions: ["Marseiles", "Mantes-la-Jolie", "Bruxelles"], matches: ["Mexique", "Combodge", "Rhône", "Finistère", "Zimbabwe", "Norvège"]),
    GenderRuleAndException(key: 78, gender: 0, rule: "Nouns ending in eur, generally derived from a verb, denoting people, professions, machines carrying out an activity or scientific things: aspirateur, facteur, ordinateur", exceptions: [], matches: ["aspirateur", "facteur", "ordinateur"]),
    GenderRuleAndException(key: 79, gender: 0, rule: "Compound nouns of the form verb-noun such as porte-monnaie, pare-brise, tire-bouchon are masculine.", exceptions: [], matches: ["porte-monnaie", "pare-brise", "tire-bouchon"]),
    GenderRuleAndException(key: 80, gender: 0, rule: "Nouns referring to male people are often masculine.", exceptions: [], matches: ["adulte", "homme", "père", "frère", "oncle", "cousin", "garçon"]),
    GenderRuleAndException(key: 81, gender: 0, rule: "A handful of nouns are masculine, whatever the gender of the person they refer to, e.g.: amateur, artiste, auteur, nudiste, témoin, vainqueur, voyou plus certain job titles.", exceptions: [], matches: ["amateur", "artiste", "auteur", "adolescent", "nudiste", "témoin", "vainqueur", "voyou"]),
    GenderRuleAndException(key: 82, gender: 1, rule: "Place names ending in -e are you usually feminie.", exceptions: [], matches: ["Franche-Comté", "Belize", "Cambodge", "Mexique", "Mozambique", "Zaïre", "Zimbabwe"]),
    GenderRuleAndException(key: 83, gender: 1, rule: "Many nouns referring to female people are feminine.", exceptions: [], matches: ["femme", "fille", "tante", "mère", "sœur", "fille"]),
    GenderRuleAndException(key: 84, gender: 1, rule: "These are feminine, whatever the gender of the person: personne, victime, recrue (recruit), connaissance (acquaintance).", exceptions: [], matches: ["personne", "victime", "recrue", "connaissance"]),
    GenderRuleAndException(key: 85, gender: 1, rule: "Certain nouns referring to animals that can refer to only the female of the species. For example: chatte (female cat), chienne (bitch), louve (she-wolf).", exceptions: [], matches: ["chatte", "chienne", "louve"]),
    GenderRuleAndException(key: 86, gender: 1, rule: "Feminine nouns that are \"generic\" terms and can refer to either male or female of the species. For example, la souris can refer to either a male or female mouse.", exceptions: [],matches: []),
    GenderRuleAndException(key: 87, gender: 1, rule: "Most other endings consisting of Vowel + Consonant + e: -ine, -ise, -alle, -elle, -esse, -ette etc", exceptions: [], matches: ["episode", "espace", "intervalle", "mille", "magazine", "réverbère", "squelette"]),
    GenderRuleAndException(key: 88, gender: 1, rule: "Figurative nouns ending in -eur, usually derived from an adjective: rougeur, largeur, pâleur, couleur, horreur, rumeur", exceptions: [], matches: []),
    GenderRuleAndException(key: 89, gender: 1, rule: "Words for durations of time are feminine", exceptions: [], matches: ["journée", "année", "soirée", "matinée", "nuitée"]),
    GenderRuleAndException(key: 90, gender: 1, rule: "Words for points in time are masculine", exceptions: [], matches: ["jour", "an", "soir", "matin"]),
    GenderRuleAndException(key: 91, gender: 1, rule: "Apocopes are words which drop part of the end. Think of \"cred\" for credit or \"mag\" for magazine in English. Apocopes in French usually take the gender of their source words.", exceptions: [], matches: ["santiag", "métro", "vélo", "auto", "accu", "actu", "ado", "appart", "ciné", "fac", "manif", "météo", "moto"]),
    GenderRuleAndException(key: 92, gender: 0, rule: "Most untraslated foreign words are masculine", exceptions: [], matches: ["look", "jury", "stock", "gang", "crash", "gaz", "match", "whisky", "URL"])
  ]
}
