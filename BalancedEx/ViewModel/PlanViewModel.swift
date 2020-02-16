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
    // var notificationToken: NotificationToken? = nil

    
    //fix double init with loadData
    init (){
        self.planList = self.realm.objects(Plan.self).sorted(byKeyPath: "createdAt", ascending: false)
        
    }

    func loadData() {
        self.planList = self.realm.objects(Plan.self).sorted(byKeyPath: "createdAt", ascending: false)
    }
    
    
    func newPlan (name:String?, descripcion:String?){
        let plan = Plan()
        plan.name = name ?? ""
        plan.descriptionPlan = descripcion ?? ""
        plan.createdAt = Date()
        do{
            try realm.write {
               realm.add(plan)
           }
       }catch{
           print("error con Realm \(error)")
       }
        loadData()
    }
    
    
    
    func deleteItems(at offsets: IndexSet) {
        DispatchQueue.main.async {
            guard let index = Array(offsets).first
                else {return}
            
            do{
                try self.realm.write {
                    self.realm.delete(self.planList[index])
                    self.loadData()
                    
                }
            }catch let error as NSError {
                print("error - \(error.localizedDescription)")
            }                         
       }
       
    }
    
    


    /*
  func loadToken() {

        // Observe Results Notifications
        notificationToken = planList.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                print("todos los datos cargaron")
                // Results are now populated and can be accessed without blocking the UI
               // tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                //
                
             
                self?.loadData()
                print("los datos se eliminaron")
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        }
    }

    deinit {
        notificationToken?.invalidate()
    }*/
       
            
   
    
    
}
