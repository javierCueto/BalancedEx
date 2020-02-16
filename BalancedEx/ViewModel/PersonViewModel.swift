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
    
    @Published var personList:Results<Person>
    let realm = try! Realm()
    var notificationToken: NotificationToken? = nil

    
    //fix double init with loadData
    init (){
        self.personList = self.realm.objects(Person.self).sorted(byKeyPath: "createdAt", ascending: false)
        loadToken()
    }

    func loadData() {
        self.personList = self.realm.objects(Person.self).sorted(byKeyPath: "createdAt", ascending: false)
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
               try self.realm.write {
                   self.realm.delete(self.personList[index])
               }
           }catch let error as NSError {
               print("error - \(error.localizedDescription)")
           }
    }
    
    
    func loadToken() {
           notificationToken = personList.observe { [weak self] (changes: RealmCollectionChange) in
               switch changes {
               case .initial:
                   print("todos los datos de personas cargaron")
               case .update:
                   //
                   self?.loadData()
                   print("se elimino,actualizo, agrego en personas")
               case .error(let error):
                   fatalError("\(error)")
               }
           }
       }

       deinit {
           notificationToken?.invalidate()
       }
       
    
}
