//
//  PlanNewView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 11/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct PlanNewView: View {
    @ObservedObject var planList = PlanViewModel()
   // @Binding var isPresented1: Bool
    @State private var newPlan = ""
    @State private var newPlanDescription = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ZStack{
            VStack(spacing: 20){
                
                Group {
                    TextField("Nuevo plan aqui", text: self.$newPlan)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.leading)
                    TextField("Description", text:  self.$newPlanDescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.leading)
                }
                
                
        
                Button(action: {
     
                    let _ = self.planList.newPlan(name: self.newPlan, descripcion: self.newPlanDescription )
                    self.newPlan = ""
                    self.newPlanDescription = ""
                    self.presentationMode.wrappedValue.dismiss()
                    
                 

                }) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Guardar")
                .padding(.horizontal) }.padding()
                } .foregroundColor(Color.white) .background(Color.gray) .cornerRadius(8)
                Spacer()
            }
            
            .padding(EdgeInsets(top: 50, leading: 26, bottom: 16, trailing: 16))
            .background(Color.yellow)
            .frame(maxWidth: .infinity)
        }
    }
}

struct PlanNewView_Previews: PreviewProvider {
    static var previews: some View {
        PlanNewView()
    }
}

