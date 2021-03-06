//
//  PersonNewView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 16/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct PersonNewView: View {
    @ObservedObject var personList = PersonViewModel()
    @State private var newPerson = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ZStack{
            VStack(spacing: 20){
                Text("Persona").font(.largeTitle)
                    .frame( maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.yellow)
                    
                
                Group {
                    TextField("Nuevo plan aqui", text: self.$newPerson)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.leading)
                }.padding()
                
                
        
                Button(action: {
                    let _ = self.personList.newPerson(name: self.newPerson)
                    self.newPerson = ""
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

struct PersonNewView_Previews: PreviewProvider {
    static var previews: some View {
        PersonNewView()
    }
}
