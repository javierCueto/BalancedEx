//
//  PlanViewModel.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 10/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import Foundation
import RealmSwift

class PlanViewModel : ObservableObject{
    
    @Published var planList:Results<Plan>
    let realm = try! Realm()
    
    
    init (){
        self.planList = realm.objects(Plan.self)
        
        

    }
    
}
