//
//  ContentView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 07/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            // First Screen
          PlanView()
            .tabItem {
                Image(systemName: "flame")
                Text("Planes")
            }
            // Second Screen
            PeopleView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Personas")
            }
            ExpensesView()
                .tabItem {
                    Image(systemName: "dollarsign.square")
                    Text("Gastos")
            }
            
            SummaryView()
                .tabItem {
                    Image(systemName: "eye")
                    Text("Resumen")
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
