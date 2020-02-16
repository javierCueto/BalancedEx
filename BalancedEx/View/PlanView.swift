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
                
             
                ForEach(0..<planList.planList.count ,id: \.self){ index in
                    NavigationLink(destination: DetailView(name: String(self.planList.planList[index].name) )){
                        VStack(alignment: .leading){
                            Text(self.planList.planList[index].name)
                            .font(.title)
                            .foregroundColor(.gray)
                            
                            Text("\(self.planList.planList[index].dateText)")
                                .font(.footnote)
                            .foregroundColor(.gray)
                        }
                        
                    }
                }
                .onDelete(perform: planList.deleteItems)

                
            }.navigationBarTitle("Planes")
            .navigationBarItems(
                 trailing:
                    Button(action: {
                        self.isPresented1.toggle()
                       
                    }) {
                        Image(systemName: "plus")
                        Text("Nuevo")
                        
                    }.sheet(isPresented: $isPresented1
                    ) {
                       // userData: self.userData
                        PlanNewView(planList: self.planList)
                            
                    }
                )
            }
            
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
