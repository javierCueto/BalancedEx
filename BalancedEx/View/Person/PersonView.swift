//
//  PeopleView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 16/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct PersonView: View {
    init() {
         UITableView.appearance().separatorStyle = .none
     }
    
   // @ObservedObject var person = PersonViewModel.personList
    @State var isPresented1: Bool = false
     
     
     var body: some View {
     
         NavigationView {
             
             List{
              
                ForEach(0..<PersonViewModel.personList.count ,id: \.self){ index in
                    NavigationLink(destination: PersonDetailView( find: index) ){
                         VStack(alignment: .leading){
                            Text(PersonViewModel.personList[index].name)
                             .font(.title)
                         }
                     }
                 }

                 
             }.navigationBarTitle("Personas")
             .navigationBarItems(
                  trailing:
                     Button(action: {
                         self.isPresented1.toggle()
                        
                     }) {
                         HStack{
                             Image(systemName: "person.badge.plus.fill")
                         }.padding(7)
                         .background(
                         RoundedRectangle(cornerRadius: 6) .stroke(Color.yellow, lineWidth: 2))
                        
                     }.sheet(isPresented: $isPresented1
                     ) {
                         PersonNewView()
                     }
                 )
             }
             
         }
}

