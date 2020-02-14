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
    
    @Published var planList:[Plan]
    let realm = try! Realm()
    
    
    init (){
        self.planList = Array(realm.objects(Plan.self))
    }
    
    func loadData(){
         self.planList = Array(realm.objects(Plan.self))
    }
    
}
