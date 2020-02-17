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
    @Published var expenses:Results<Expense>?
   //let realm = try! Realm()
    var notificationToken: NotificationToken? = nil

    init (){
        loadData()
        loadToken()
    }
    
    func loadData(){
        let total:Float = RealmDB.realm.objects(Expense.self).filter("idPlan.status == 'Default'").sum(ofProperty: "total")
        self.totalExpenses = String(format:"%.2f", total)
    }
    
    
    func loadToken() {
        print("entrooooooooo")
        notificationToken = expenses?.observe { [weak self] (changes: RealmCollectionChange) in
                switch changes {
                case .initial:
                    print("Gatos => Cargados")
                case .update:
                    //
                    self?.loadData()
                    print("Gastos => Movimientos")
                case .error(let error):
                    fatalError("\(error)")
                }
            }
        }

        deinit {
            notificationToken?.invalidate()
        }
        
}
