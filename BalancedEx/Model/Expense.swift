//
//  Expense.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 09/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import Foundation
import RealmSwift

class Expense: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var concept: String = ""
    @objc dynamic var descriptionExpense: String = ""
    @objc dynamic var total: Float = 0.0
    @objc dynamic var idPerson: Person?
    var parentPlan = LinkingObjects(fromType: Plan.self, property: "expenses")
    @objc dynamic var createdAt : Date?
    @objc dynamic var deletedAt : Date?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
