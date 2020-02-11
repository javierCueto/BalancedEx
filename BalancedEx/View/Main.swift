//
//  ContentView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 07/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            // First Screen
            PlanView()
            .tabItem {
                Image(systemName: "flame")
                Text("Planes")
            }.tag(1)
            // Second Screen
            PeopleView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Personas")
            }.tag(2)
            
            ExpensesView()
                .tabItem {
                    Image(systemName: "dollarsign.square")
                    Text("Gastos")
            }.tag(3)
            
            SummaryView()
                .tabItem {
                    Image(systemName: "eye")
                    Text("Resumen")
            }.tag(4)
            
        }
        //.edgesIgnoringSafeArea(.top)
        .accentColor(.yellow)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
