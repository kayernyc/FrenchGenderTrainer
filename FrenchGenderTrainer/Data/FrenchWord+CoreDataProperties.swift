//
//  FrenchWord+CoreDataProperties.swift
//  
//
//  Created by KATHRIN AYER on 12/28/19.
//
//

import Foundation
import CoreData

extension FrenchWord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FrenchWord> {
        return NSFetchRequest<FrenchWord>(entityName: "FrenchWord")
    }

    @NSManaged public var english: String?
    @NSManaged public var exception: Bool
    @NSManaged public var french: String?
    @NSManaged public var gender: Int16
    @NSManaged public var genderRuleKey: Int64
    @NSManaged public var version: Int64
    @NSManaged public var wordKey: UUID?

}
