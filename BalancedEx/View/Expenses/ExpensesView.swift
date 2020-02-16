//
//  ExpensesView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 09/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct ExpensesView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
    }
       
    @ObservedObject var expensesList = ExpensesViewModel()
    @State var isPresented1: Bool = false
        
    var body: some View {
        NavigationView {
        List{
         
           ForEach(0..<expensesList.expenses.count ,id: \.self){ index in
              VStack(alignment: .leading){
                  Text(self.expensesList.expenses[index].concept)
                  .font(.title)
                  
                  Text("$ \(String(format: "%.2f", self.expensesList.expenses[index].total))")
                      .font(.footnote)
              }
            }
            
        }.navigationBarTitle("Gastos")
        .navigationBarItems(
             trailing:
                Button(action: {
                    self.isPresented1.toggle()
                   
                }) {
                    HStack{
                        Image(systemName: "gift")
                    }.padding(7)
                   
                }.sheet(isPresented: $isPresented1
                ) {
                    ExpensesNewView(expensesList: self.expensesList)
                }
            )
        }
    }
}






