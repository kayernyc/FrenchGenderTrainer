//
//  GenderRulesText.swift
//  FrenchGenderTrainer
//
//  Created by KATHRIN AYER on 3/7/19.
//  Copyright © 2019 happierplaces. All rights reserved.
//

import Foundation
// http://www.french-linguistics.co.uk/grammar/le_or_la_in_french.shtml
// https://www.thoughtco.com/french-gender-masculine-endings-1368853

struct GenderRuleAndException {
  let index: Int
  let rule: String
  let exceptions: [String]
}

// swiftlint:disable line_length
struct GenderRulesText {
  let mascRulesCollection = [
    GenderRuleAndException(index: 0, rule: "phone", exceptions: []),
    GenderRuleAndException(index: 1, rule: "ueil", exceptions: []),
    GenderRuleAndException(index: 2, rule: "isme", exceptions: []),
    GenderRuleAndException(index: 3, rule: "ment", exceptions: ["jument"]),
    GenderRuleAndException(index: 4, rule: "cide", exceptions: []),
    GenderRuleAndException(index: 5, rule: "tre", exceptions: ["fenêtre", "huître", "lettre", "montre", "rencontre", "vitre"]),
    GenderRuleAndException(index: 6, rule: "ège", exceptions: []),
    GenderRuleAndException(index: 7, rule: "ard", exceptions: []),
    GenderRuleAndException(index: 8, rule: "age", exceptions: ["cage", "image", "nage", "page", "plage", "rage"]),
    GenderRuleAndException(index: 9, rule: "ble", exceptions: ["cible", "étable", "fable", "table"]),
    GenderRuleAndException(index: 10, rule: "cle", exceptions: ["boucle"]),
    GenderRuleAndException(index: 11, rule: "ing", exceptions: []),
    GenderRuleAndException(index: 12, rule: "ste", exceptions: ["liste", "modiste", "piste"]),
    GenderRuleAndException(index: 13, rule: "one", exceptions: []),
    GenderRuleAndException(index: 14, rule: "ope", exceptions: []),
    GenderRuleAndException(index: 15, rule: "oir", exceptions: []),
    GenderRuleAndException(index: 16, rule: "ail", exceptions: []),
    GenderRuleAndException(index: 17, rule: "eil", exceptions: []),
    GenderRuleAndException(index: 18, rule: "eau", exceptions: ["eau", "peau"]),
    GenderRuleAndException(index: 19, rule: "ème", exceptions: []),
    GenderRuleAndException(index: 20, rule: "de", exceptions: ["bride", "merde", "méthode", "pinède", "ade, -nde, -ude endings"]),
    GenderRuleAndException(index: 21, rule: "et ", exceptions: []),
    GenderRuleAndException(index: 22, rule: "ot", exceptions: []),
    GenderRuleAndException(index: 23, rule: "at", exceptions: []),
    GenderRuleAndException(index: 24, rule: "il", exceptions: []),
    GenderRuleAndException(index: 25, rule: "me", exceptions: ["alarme", "âme", "arme", "cime", "coutume", "crème", "écume", "énigme", "estime", "ferme", "firme", "forme", "larme", "plume", "rame", "rime"]),
    GenderRuleAndException(index: 26, rule: "ou", exceptions: []),
    GenderRuleAndException(index: 27, rule: "d", exceptions: []),
    GenderRuleAndException(index: 28, rule: "f", exceptions: ["soif", "clef", "nef"]),
    GenderRuleAndException(index: 29, rule: "n", exceptions: ["façon", "fin", "leçon", "main", "maman", "rançon"]),
    GenderRuleAndException(index: 30, rule: "p", exceptions: []),
    GenderRuleAndException(index: 31, rule: "r", exceptions: ["chair", "cour", "cuiller", "mer", "tour"]),
    GenderRuleAndException(index: 32, rule: "s", exceptions: [ "brebis", "fois", "oasis", "souris", "vis"]),
    GenderRuleAndException(index: 33, rule: "t", exceptions: ["burlat", "dent", "dot", "forêt", "mort", "nuit", "part", "plupart", "ziggourat"]),
    GenderRuleAndException(index: 34, rule: "k", exceptions: []),
    GenderRuleAndException(index: 35, rule: "l", exceptions: ["roseval"]),
    GenderRuleAndException(index: 36, rule: "m", exceptions: ["faim"]),
    GenderRuleAndException(index: 37, rule: "x", exceptions: ["croix", "noix", "paix", "toux", "voix"]),
    GenderRuleAndException(index: 38, rule: "o", exceptions: ["dactylo", "dynamo", "libido", "météo", "moto", "steno"]), //most of these are apocopes of longer feminine words
    GenderRuleAndException(index: 39, rule: "i", exceptions: ["foi", "fourmi", "loi", "paroi", "merci"]),
    GenderRuleAndException(index: 40, rule: "é", exceptions: ["clé", "psyché", "sé, té, and tié endings"]),
    GenderRuleAndException(index: 41, rule: "u", exceptions: ["tribu", "vertu"]),
    GenderRuleAndException(index: 42, rule: "A handful of nouns are masculine, whatever the gender of the person they refer to, e.g.: amateur, artiste, auteur, nudiste, témoin, vainqueur, voyou plus certain job titles.", exceptions: []),
    GenderRuleAndException(index: 43, rule: "Words ending in other consonants (in the spelling).", exceptions: ["fac"]),
    GenderRuleAndException(index: 44, rule: "Certain nouns referring to animals that can refer to only the male of the species. For example: étalon (stallion), cerf (stag), matou (tomcat).", exceptions: []),
    GenderRuleAndException(index: 45, rule: "Masculine nouns that are 'generic' terms and can refer to either a male or female of the species. For example, le cheval can refer to either a male or female horse.", exceptions: []),
    GenderRuleAndException(index: 46, rule: "Names of towns. Other place names (departments, rivers, countries) not ending in -e. Sometimes town names, especially if they look or sound feminine (e.g. Marseilles ending in -es), can be treated as feminine. This is quite rare, though.", exceptions: ["Mexique", "Combodge", "Rhône", "Finistère", "Zimbabwe", "Norvège"]),
    GenderRuleAndException(index: 47, rule: "eur, generally derived from a verb, denoting people, professions, machines carrying out an activity or scientific things: aspirateur, facteur, ordinateur", exceptions: []),
    GenderRuleAndException(index: 48, rule: "Compound nouns of the form verb-noun: porte-monnaie, pare-brise, tire-bouchon.", exceptions: []),
    GenderRuleAndException(index: 49, rule: "Nouns referring to male people.", exceptions: [])
  ]

  let femRulesCollection = [
    GenderRuleAndException(index: 0, rule: "ence", exceptions: ["silence"]),
    GenderRuleAndException(index: 1, rule: "euse", exceptions: []),
    GenderRuleAndException(index: 2, rule: "ance", exceptions: []),
    GenderRuleAndException(index: 3, rule: "esse", exceptions: []),
    GenderRuleAndException(index: 4, rule: "ique", exceptions: ["graphique", "périphérique"]),
    GenderRuleAndException(index: 5, rule: "ière", exceptions: ["arrière", "cimetière", "derrière"]),
    GenderRuleAndException(index: 6, rule: "son", exceptions: ["blouson"]),
    GenderRuleAndException(index: 7, rule: "tié", exceptions: []),
    GenderRuleAndException(index: 8, rule: "ude", exceptions: ["coude", "interlude", "prélude"]),
    GenderRuleAndException(index: 9, rule: "ue", exceptions: ["abaque"]),
    GenderRuleAndException(index: 10, rule: "ule", exceptions: ["préambule", "scrupule", "tentacule", "testicule", "véhicule", "ventricule", "vestibule"]),
    GenderRuleAndException(index: 11, rule: "ure", exceptions: ["centaure", "cyanure", "dinosaure", "murmure"]),
    GenderRuleAndException(index: 12, rule: "ace", exceptions: ["ace", "palace"]),
    GenderRuleAndException(index: 13, rule: "ade", exceptions: ["grade", "jade", "stade"]),
    GenderRuleAndException(index: 14, rule: "ale", exceptions: ["châle", "pétale", "scandale"]),
    GenderRuleAndException(index: 15, rule: "ine", exceptions: ["capitaine", "domaine", "moine", "magazine", "patrimoine"]),
    GenderRuleAndException(index: 16, rule: "ion", exceptions: ["avion", "bastion", "billion", "camion", "cation", "dominion", "espion", "ion", "lampion", "lion", "million", "morpion", "pion", "scion", "scorpion", "trillion"]),
    GenderRuleAndException(index: 17, rule: "ire", exceptions: ["auditoire", "commentaire", "dictionnaire", "directoire", "horaire", "itinéraire", "ivoire", "laboratoire", "navire", "pourboire", "purgatoire", "répertoire", "salaire", "sommaire", "sourire", "territoire", "vocabulaire"]),
    GenderRuleAndException(index: 18, rule: "ise", exceptions: []),
    GenderRuleAndException(index: 19, rule: "ite", exceptions: ["anthracite", "ermite", "granite", "graphite", "mérite", "opposite", "plébiscite", "rite", "satellite", "site", "termite"]),
    GenderRuleAndException(index: 20, rule: "lle", exceptions: ["braille", "gorille", "intervalle", "mille", "portefeuille", "vaudeville", "vermicelle", "violoncelle"]),
    GenderRuleAndException(index: 21, rule: "mme", exceptions: ["dilemme", "gramme", "programme"]),
    GenderRuleAndException(index: 22, rule: "nde", exceptions: ["monde"]),
    GenderRuleAndException(index: 23, rule: "nne", exceptions: []),
    GenderRuleAndException(index: 24, rule: "ole", exceptions: ["contrôle", "monopole", "rôle", "symbole"]),
    GenderRuleAndException(index: 25, rule: "rre", exceptions: ["beurre", "parterre", "tonnerre", "verre"]),
    GenderRuleAndException(index: 26, rule: "be", exceptions: ["cube", "globe", "microbe", "tube", "verbe"]),
    GenderRuleAndException(index: 27, rule: "ce", exceptions: ["artifice", "armistice", "appendice", "bénéfice", "caprice", "commerce", "dentifrice", "divorce", "exercice", "office", "orifice", "précipice", "prince", "sacrifice", "service", "silence", "solstice", "supplice", "vice"]),
    GenderRuleAndException(index: 28, rule: "cé", exceptions: ["crustacé"]),
    GenderRuleAndException(index: 29, rule: "ee", exceptions: ["pedigree"]),
    GenderRuleAndException(index: 30, rule: "ée", exceptions: ["apogée", "lycée", "musée", "périgée", "trophée"]),
    GenderRuleAndException(index: 31, rule: "fe", exceptions: ["golfe"]),
    GenderRuleAndException(index: 32, rule: "ie", exceptions: ["incendie", "foie", "génie", "parapluie", "sosie"]),
    GenderRuleAndException(index: 33, rule: "se", exceptions: ["carosse", "colosse", "gypse", "inverse", "malaise", "pamplemousse", "parebrise", "suspense"]),
    GenderRuleAndException(index: 34, rule: "sé", exceptions: ["exposé", "opposé"]),
    GenderRuleAndException(index: 35, rule: "té", exceptions: ["arrêté", "comité", "comté", "côté", "député", "été", "pâté", "traité"]),
    GenderRuleAndException(index: 36, rule: "e", exceptions: ["peuple"]),
    GenderRuleAndException(index: 37, rule: "Place names ending in -e.", exceptions: ["Franche-Comté", "Belize", "Cambodge", "Mexique", "Mozambique", "Zaïre", "Zimbabwe"]),
    GenderRuleAndException(index: 38, rule: "Nouns referring to female people.", exceptions: []),
    GenderRuleAndException(index: 39, rule: "These are feminine, whatever the gender of the person: personne, victime, recrue (recruit), connaissance (acquaintance).", exceptions: []),
    GenderRuleAndException(index: 40, rule: "Certain nouns referring to animals that can refer to only the female of the species. For example: chatte (female cat), chienne (bitch), louve (she-wolf).", exceptions: []),
    GenderRuleAndException(index: 41, rule: "Feminine nouns that are 'generic' terms and can refer to either male or female of the species. For example, la souris can refer to either a male or female mouse.", exceptions: []),
    GenderRuleAndException(index: 42, rule: "Most other endings consisting of Vowel + Consonant + e: -ine, -ise, -alle, -elle, -esse, -ette etc", exceptions: ["episode", "espace", "intervalle", "mille", "magazine", "réverbère", "squelette"]),
    GenderRuleAndException(index: 43, rule: "Figurative nouns ending in -eur, usually derived from an adjective: rougeur, largeur, pâleur, couleur, horreur, rumeur", exceptions: [])
  ]

  /* orphans
   la fac apocope of la faculté
 */
}
