//
//  PlanListView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 09/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct PlanView: View {
    @ObservedObject var planList = PlanViewModel()
    @State var needRefresh: Bool = false
    @State var isPresented1: Bool = false
    @State var isPresented2: Bool = false
    
    
    var body: some View {
    
        NavigationView {
            
            List{
                
                
                ForEach(planList.planList,id: \.id){ data in
                    NavigationLink(destination: DetailView(name: data.name)){
                        Text(data.name)
                        .font(.title)
                        .foregroundColor(.gray)
                    }
                }
                .onDelete(perform: deleteItem)
                }.navigationBarTitle("Planes")
                .navigationBarItems(
                 trailing:
                    Button(action: {
                        self.isPresented1.toggle()
                       
                    }) {
                        Image(systemName: "plus")
                        Text("Nuevo")
                        
                    }.sheet(isPresented: $isPresented1, onDismiss:{(
                        self.planList.loadData()
                        )}
                    ) {
                       // userData: self.userData
                        PlanNewView()
                            
                    }
                )
            }
            
        }

         func deleteItem(at offsets: IndexSet)  {
              guard let index = Array(offsets).first
                  else {return}
            

            let planD: Plan = self.planList.planList [index]
    
              self.planList.planList.remove(at: index)
            
            DispatchQueue.main.async {
                 let _ = PlanDeleteViewModel(plan: planD)
              }
          
           //
              // self.planList.loadData()
          }
}


struct DetailView:View {
    let name: String
    var body: some View{
        Text("\(name)")
    }
}

struct PlanListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
