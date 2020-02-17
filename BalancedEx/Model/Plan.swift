//
//  Plan.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 09/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import Foundation

import RealmSwift


let dateFormatter = DateFormatter()

class Plan: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var descriptionPlan: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var createdAt : Date?
    @objc dynamic var deletedAt : Date?
   // let expenses = List<Expense>()
    
    var dateText: String {
           dateFormatter.dateFormat = "MMM d yyyy, h:mm a"
            return dateFormatter.string(from: createdAt ?? Date())
      }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
