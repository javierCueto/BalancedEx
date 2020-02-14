//
//  PlanNewViewModel.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 11/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import Foundation
import RealmSwift

class PlanNewViewModel : ObservableObject{
    
    //@Published var planList:Results<Plan>
    let realm = try! Realm()
    
    
    init (name:String?, descripcion:String?){
        let plan = Plan()
        plan.name = name ?? ""
        plan.descriptionPlan = descripcion ?? ""
        plan.createdAt = Date()
        do{
            let realm = try Realm()
            try realm.write {

               realm.add(plan)
           }
           
       }catch{
           print("error con Realm \(error)")
       }

    }
    
}
