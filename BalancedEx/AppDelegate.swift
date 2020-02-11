//
//  AppDelegate.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 07/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         print(Realm.Configuration.defaultConfiguration.fileURL)
        
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 2,

            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
            })

        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
        // cmd + shif + g = to show the url /Users/jjcueto/Library/Developer/CoreSimulator/Devices/586D248F-B2ED-47EC-BE58-66780B388996/data/Containers/Data/Application/9D2F7B73-B1F2-4919-B893-A7772AEC0664/Documents/default.realm
        
     
        
        /*
        let person = Person()
        person.name = "javier3"
        person.createdAt = Date()
        
        let expense = Expense()
        expense.concept = "refresco"
        expense.total = 12.00
        expense.idPerson = person
        expense.createdAt = Date()
       
        */
       
       /* let plan = Plan()
        plan.name = "Colima Boda"
        plan.createdAt = Date()
        
        
        do{
            let realm = try Realm()
            
            
            
            try realm.write {
                //realm.add(person)
               // realm.add(expense)
                realm.add(plan)
             //   plan.expenses.append(expense)
            }

            
        }catch{
            print("error con Realm \(error)")
        }
        
     
       */
        ////////////////////////////////////////
        
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

