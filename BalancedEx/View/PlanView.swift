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
    
    var body: some View {
        NavigationView {
            
            List(planList.planList,id: \.self){
                      data in
                
                NavigationLink(destination: DetailView(name: data.name)){
                                Text(data.name)
                                                       .font(.title)
                                                       .foregroundColor(.gray)
                }
             
                          
            }.navigationBarTitle("Planes")
            //.navigationBarTitle(Text("Navigation Views"))
            //.edgesIgnoringSafeArea(.top)
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
