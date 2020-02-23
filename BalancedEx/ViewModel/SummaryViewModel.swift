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
    @Published var totalByPersonString: String = "$ 0.0"
    @Published var defaultPlan: Plan?
    @Published var personExpenses = [PersonExpense]()
    
    init(){
        loadData()
    }
    
    func loadData(){
        personExpenses = []
        if let plan = RealmDB.realm.objects(Plan.self).filter("status == 'Default'").first {
                defaultPlan = plan
            let total:Float = RealmDB.realm.objects(Expense.self).filter("idPlan.status == 'Default'").sum(ofProperty: "total")
            
            let totalPerson:Float = Float(RealmDB.realm.objects(Expense.self).filter("idPlan.status == 'Default'").distinct(by: ["idPerson.id"]).count)
            
            let totalByPerson = total / totalPerson
            
            self.totalExpenses = String(format:"%.2f", total)
            
            self.totalByPersonString = String(format:"%.2f", totalByPerson)
            
            let persons = RealmDB.realm.objects(Expense.self).filter("idPlan.status == 'Default'")
            for item in persons {
                let personEX = PersonExpense(id: item.idPerson?.id, name: item.idPerson?.name, total: item.total, totalDebt: -totalByPerson + item.total)
                
                if let ex = personExpenses.firstIndex(of: personEX) {
                    personExpenses[ex].total = personExpenses[ex].total + item.total
                    
                  //  if personExpenses[ex].total > totalByPerson {
                        personExpenses[ex].totalDebt = personExpenses[ex].total - totalByPerson
                        print(personExpenses[ex].totalDebt)
                        print(personExpenses[ex].total )
                    //}else{
                      //  personExpenses[ex].totalDebt = totalByPerson + personExpenses[ex].total
                    //}
                    
                    
                }else{
                    personExpenses.append(personEX)
                                print("································")
                }
                    
            
            }
            
            print(personExpenses)
        }
        
        

    }
    
    
        
}
