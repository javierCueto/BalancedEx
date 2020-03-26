//
//  PlanDetailView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 15/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct PlanDetailView: View {
    @State var planList = PlanViewModel()
    @State var find: Int
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        VStack( spacing: 20){
            VStack {
                Text(planList.planList[find].descriptionPlan)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal , 20)
            .padding(.vertical, 60)
            .background(Color("YellowColor"))
            
            VStack{
                Button(action: {
                    self.planList.setDefault(planDefault: self.planList.planList[self.find])
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Default")
                    .frame(maxWidth: .infinity , maxHeight :40)
                    
                }.foregroundColor(Color.white) .background(Color("YellowColor")) .cornerRadius(8)

            }
            .padding()
            Spacer()
            .shadow(color: .gray, radius: 10)
        }.navigationBarTitle(planList.planList[find].name)
    
        
        
    }
}
