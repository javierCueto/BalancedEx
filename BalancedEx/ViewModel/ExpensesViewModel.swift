//
//  ExpensesViewModel.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 16/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import Foundation
import RealmSwift
class ExpensesViewModel : ObservableObject{
    
    @Published var expenses:Results<Expense>
    let realm = try! Realm()
    var notificationToken: NotificationToken? = nil

    
    //fix double init with loadData
    init (){
        self.expenses = self.realm.objects(Expense.self).sorted(byKeyPath: "createdAt", ascending: false)
        loadToken()
    }

    func loadData() {
        self.expenses = self.realm.objects(Expense.self).sorted(byKeyPath: "createdAt", ascending: false)
    }
    
    
    func newPerson (concept:String?, descriptionEx:String? , total:Double?){
        let expense = Expense()
        expense.concept = concept ?? ""
        expense.descriptionExpense = descriptionEx ?? ""
        expense.total = Float(total ?? 0.0) 
         do{
             try realm.write {
                realm.add(expense)
            }
        }catch{
            print("error con Realm \(error)")
        }
     }
     
    
    
    func deleteItems(at offsets: IndexSet) {
           guard let index = Array(offsets).first
               else {return}
           
           do{
               try self.realm.write {
                   self.realm.delete(self.expenses[index])
               }
           }catch let error as NSError {
               print("error - \(error.localizedDescription)")
           }
    }
    
    
    func loadToken() {
           notificationToken = expenses.observe { [weak self] (changes: RealmCollectionChange) in
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
