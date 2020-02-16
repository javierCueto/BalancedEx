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
    @State private var newPlan = ""
    @State private var newPlanDescription = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ZStack{
            VStack(spacing: 20){
                Text("Nuevo Plan").font(.largeTitle)
                    .frame( maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.yellow)
                    
                
                Group {
                    TextField("Nuevo plan aqui", text: self.$newPlan)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.leading)
                    TextField("Descrición", text:  self.$newPlanDescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.leading)
                }.padding()
                
                
        
                Button(action: {
                    let _ = self.planList.newPlan(name: self.newPlan, descripcion: self.newPlanDescription )
                    self.newPlan = ""
                    self.newPlanDescription = ""
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                        Text("Guardar")
                            .padding()
                } .foregroundColor(Color.white) .background(Color.yellow) .cornerRadius(8)
                
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct PlanNewView_Previews: PreviewProvider {
    static var previews: some View {
        PlanNewView()
    }
}

