//
//  PeopleViewModel.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 16/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import Foundation
import RealmSwift



class PersonViewModel : ObservableObject{
    
    static var personList:Results<Person> = RealmDB.realm.objects(Person.self).sorted(byKeyPath: "createdAt", ascending: false)
   
    let realm = try! Realm()
    var notificationToken: NotificationToken? = nil

    
  

    func loadData() {
        PersonViewModel.personList = RealmDB.realm.objects(Person.self).sorted(byKeyPath: "createdAt", ascending: false)
    }
    
    
    func newPerson (name:String?){
        let person = Person()
        person.name = name ?? ""
        
         do{
             try realm.write {
                realm.add(person)
            }
        }catch{
            print("error con Realm \(error)")
        }
     }
     
    
    
    func deleteItems(at offsets: IndexSet) {
           guard let index = Array(offsets).first
               else {return}
           
           do{
               try RealmDB.realm.write {
                RealmDB.realm.delete(PersonViewModel.personList[index])
               }
           }catch let error as NSError {
               print("error - \(error.localizedDescription)")
           }
    }
    
    
    /*
    func loadToken() {
        notificationToken = PersonViewModel.personList.observe { [weak self] (changes: RealmCollectionChange) in
               switch changes {
               case .initial:
                   print("Personas => Cargados")
               case .update:
                   //
                   self?.loadData()
                   print("Personas => Movimiento")
               case .error(let error):
                   fatalError("\(error)")
               }
           }
       }

       deinit {
           notificationToken?.invalidate()
       }
       
    */
}
