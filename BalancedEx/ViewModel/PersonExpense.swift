//
//  PersonExpense.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 23/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import Foundation


struct PersonExpense: Hashable {
    
    static func == (lhs: PersonExpense, rhs: PersonExpense) -> Bool {
        return lhs.id == rhs.id
    }
    var id: String?
    var name: String?
    var total: Float
    var totalDebt : Float

}

