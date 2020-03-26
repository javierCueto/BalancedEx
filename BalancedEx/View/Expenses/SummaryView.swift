//
//  SummaryView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 09/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    @ObservedObject var summary = SummaryViewModel()
    var body: some View {
        VStack(spacing: 20){
            VStack(spacing : 10){
                Text("\(self.summary.defaultPlan?.name ?? "Sin plan")")
                    .font(.title)
                    .foregroundColor(Color.init("YellowColor"))
                    .fontWeight(.bold)
                  .onAppear(perform: { self.summary.loadData()})
                
                HStack{
                    Text("Total Gastado: ")
                        .fontWeight(.semibold)
                    Text("$ \(self.summary.totalExpenses)")
                       
                        .font(.body)
                }
                HStack{
                   Text("Por Persona: ")
                       .fontWeight(.semibold)
                    Text("$ \(self.summary.totalByPersonString)")
                       .font(.body)
               }
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.init("GrayBlackLowColor"), Color.init("GrayBlackLowColor")]), startPoint: .top, endPoint: .bottomTrailing))
            .foregroundColor(Color.init("WhiteColor"))
            .cornerRadius(10)
            .shadow(radius: 10, y: 10)
            
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20){
                    ForEach(0..<summary.personExpenses.count ,id: \.self){ index in
                        detailTotalByPerson(find: index)
                    }
               
                }
               
            }.shadow(radius: 10, y: 10)
                  
  
            Spacer()
        }.padding()
   
        
    

    }
}



struct detailTotalByPerson: View {
      var summary = SummaryViewModel()
    @State var find: Int
    var body: some View {
        VStack(spacing : 10){
            HStack{
                Image(systemName: "person.circle")
                Text("\(summary.personExpenses[find].name ?? "Sin nombre")")
                .fontWeight(.bold)
                .onAppear(perform: { self.summary.loadData()})
            }
            .font(.headline)
            .foregroundColor(Color.init("GrayBlackLowColor"))
            HStack(){
                Text("Total Gastado: ")
                 Text("$ \(String(format:"%.2f", summary.personExpenses[find].total ))")
                    .font(.body)
            }
            .foregroundColor(Color.init("GrayBlackLowColor"))
            HStack(){
                Text("$ \(String(format:"%.2f", summary.personExpenses[find].totalDebt ))")
                    .font(.body)
            }.foregroundColor(summary.personExpenses[find].totalDebt>=0 ? Color.green : Color.red)
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.init("WhiteColor"))
        .cornerRadius(10)
    }
}
