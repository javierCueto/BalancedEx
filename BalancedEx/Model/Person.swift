//
//  Person.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 09/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import Foundation

import RealmSwift

class Person: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var createdAt : Date?
    @objc dynamic var deletedAt : Date?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}


