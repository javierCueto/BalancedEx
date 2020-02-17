//
//  ExpensesNewView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 16/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct ExpensesNewView: View {
    @ObservedObject var expensesList = ExpensesViewModel()
    @State private var concept = ""
    @State private var descriptionExpense = ""
    @State private var total = ""
    @State private var totalDouble: Double = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var keyboardUp = false
    private var keyboardHeight: CGFloat { 270 }
    @State private var idUser = 0
    @State private var showingAlert = false
   // @State private var persons = PersonViewModel()
    //var youTubers = ["Sean", "Chris", "Mark", "Scott", "Paul"]
    var body: some View {
        
        ZStack{
            VStack{
                Text("Nuevo gasto").font(.largeTitle)
                    .frame( maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.yellow)
                Spacer()
            }.zIndex(1)
            
            VStack(){
                VStack{
                    Picker(selection: self.$idUser, label: Text(""))
                     {
                         ForEach(0..<PersonViewModel.personList.count ,id: \.self){ index in
                                 Row(find: index)
                         }
                     }.labelsHidden()
                     .padding() .background(RoundedRectangle(cornerRadius: 15) .stroke(Color.yellow, lineWidth: 1))
                 
                     Group {
                         TextField("Concepto", text: self.$concept, onEditingChanged: {
                             self.keyboardUp = $0
                         })
                             .textFieldStyle(RoundedBorderTextFieldStyle())
                             .multilineTextAlignment(.leading)
                         
                         TextField("0", text: self.$total , onEditingChanged: {
                             self.keyboardUp = $0
               
                                print( self.total)
                         })
                             .textFieldStyle(RoundedBorderTextFieldStyle())
                             .multilineTextAlignment(.leading)
                             .keyboardType(.numbersAndPunctuation)
                         TextField("Descripcion", text: self.$descriptionExpense, onEditingChanged: {
                             self.keyboardUp = $0
                         })
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .multilineTextAlignment(.leading)
                     }.padding()
                                    
                     Button(action: {
                        self.totalDouble = Double(self.total) ?? 0.0
                        self.showingAlert = self.expensesList.newPerson(concept: self.concept, descriptionEx: self.descriptionExpense, total: self.totalDouble ,person : PersonViewModel.personList[self.idUser] )
                        //print(self.youTuberName)
                        if !self.showingAlert {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        
                     }) {
                             Text("Guardar")
                                
                     }  .padding() .foregroundColor(Color.white) .background(Color.yellow) .cornerRadius(8)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Mensaje"), message: Text("Seleccione un plan por default"), dismissButton: .default(Text("Entendido")) {
                             self.presentationMode.wrappedValue.dismiss()
                            } )
                    }
                     
                    
                }.offset(y: keyboardUp ? -keyboardHeight : 0)
       
                .animation(.easeIn)
                    
                Spacer()
            }
            .padding(.top , 80)
            .frame(maxWidth: .infinity)
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct Row : View {
    var find: Int
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
            Text(PersonViewModel.personList[find].name)
        }.tag(find)

    }
        
}

