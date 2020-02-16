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
    var notificationToken: NotificationToken? = nil

    
    //fix double init with loadData
    init (){
        self.planList = self.realm.objects(Plan.self).sorted(byKeyPath: "createdAt", ascending: false)
        loadToken()
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
    }
    
    
    
    func deleteItems(at offsets: IndexSet) {
        DispatchQueue.main.async {
            guard let index = Array(offsets).first
                else {return}
            
            do{
                try self.realm.write {
                    self.realm.delete(self.planList[index])   
                }
            }catch let error as NSError {
                print("error - \(error.localizedDescription)")
            }                         
       }
       
    }
    
    
    func setDefault(planDefault :Plan) {
        do{
            for plan in planList {
                
                if plan.id == planDefault.id{
                    try self.realm.write {
                        planDefault.status = "Default"
                    }
                }else{
                    try self.realm.write {
                        plan.status = ""
                    }
                }
            
            }
             
        }catch let error as NSError {
            print("error - \(error.localizedDescription)")
        }
        
    }
       
    
    


    
  func loadToken() {
        notificationToken = planList.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                print("todos los datos cargaron")
            case .update:
                //
                self?.loadData()
                print("algo paso con los plan")
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }

    deinit {
        notificationToken?.invalidate()
    }

}
