//
//  PlanDeleteViewModel.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 12/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import Foundation

import RealmSwift

class PlanDeleteViewModel {
    
    //@Published var planList:Results<Plan>
    let realm = try! Realm()
    
    
    init (plan: Plan){

 
        try! self.realm.write {
            self.realm.delete(plan)
       }
     
            
           
    

    }
    
}
