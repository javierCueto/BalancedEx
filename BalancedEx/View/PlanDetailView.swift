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

            .background(Color.yellow) //.cornerRadius(20)
            VStack{
                Button(action: {
                    self.planList.setDefault(planDefault: self.planList.planList[self.find])
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Default")
                    .padding() .background(
                    RoundedRectangle(cornerRadius: 10) .stroke(Color.yellow, lineWidth: 2))
                }
            }
            .padding()
            Spacer()
            .shadow(color: .gray, radius: 10)
        }.navigationBarTitle(planList.planList[find].name)
    
        
        
    }
}

/*
struct PlanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlanDetailView()
    }
}
*/
