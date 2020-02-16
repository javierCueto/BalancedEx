//
//  PlanListView.swift
//  BalancedEx
//
//  Created by José Javier Cueto Mejía on 09/02/20.
//  Copyright © 2020 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI




struct PlanView: View {
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    
   @ObservedObject var planList = PlanViewModel()
    @State var needRefresh: Bool = false
    @State var isPresented1: Bool = false
    @State var isPresented2: Bool = false
    
    
    var body: some View {
    
        NavigationView {
            
            List{
             
                ForEach(0..<planList.planList.count ,id: \.self){ index in
                    NavigationLink(destination: PlanDetailView(planList: self.planList , find: index) ){
                        VStack(alignment: .leading){
                            Text(self.planList.planList[index].name)
                            .font(.title)
                    
                            
                            Text(self.planList.planList[index].dateText)
                                .font(.footnote)
                            
              
                        }
                    }.listRowBackground(self.planList.planList[index].status == "Default" ?  Color.yellow : Color.clear)
                }
                .onDelete(perform: planList.deleteItems)

                
            }.navigationBarTitle("Planes")
            .navigationBarItems(
                 trailing:
                    Button(action: {
                        self.isPresented1.toggle()
                       
                    }) {
                        HStack{
                            Image(systemName: "plus")
                        }.padding(6)
                        .background(
                        RoundedRectangle(cornerRadius: 6) .stroke(Color.yellow, lineWidth: 2))
                       
                    }.sheet(isPresented: $isPresented1
                    ) {
                        PlanNewView(planList: self.planList)
                    }
                )
            }
            
        }
}


//struct DetailView:View {

//}

struct PlanListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
