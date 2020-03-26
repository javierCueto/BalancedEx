//
//  PersonDetailView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 16/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct PersonDetailView: View {
   // @State var personList = PersonViewModel()
    @State var find: Int
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        VStack( spacing: 20){
            VStack {
                Text("Lista de lo que ha gastado")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal , 20)
            .padding(.vertical, 60)
            .background(Color("YellowColor"))

            Spacer()
            .shadow(color: .gray, radius: 10)
        }.navigationBarTitle(PersonViewModel.personList[find].name)
    
        
        
    }
}
