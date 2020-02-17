//
//  SumaryViewModel.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 16/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import Foundation
import RealmSwift



class SummaryViewModel : ObservableObject{
    @Published var totalExpenses: String = "$ 0.0"

    
    func loadData(){
         print("entrooooooooo")
        let total:Float = RealmDB.realm.objects(Expense.self).filter("idPlan.status == 'Default'").sum(ofProperty: "total")
        self.totalExpenses = String(format:"%.2f", total)
    }
    
    
        
}
