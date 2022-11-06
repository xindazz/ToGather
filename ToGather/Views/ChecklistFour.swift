//
//  ChecklistFour.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//

import Foundation

import SwiftUI
MARK:- Radio Button Field


struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool
}


struct CheckListTwo: View {
    
    
    @State private var tasks = [Task(name: "Purchase plane tickets to NYC by you, as of September 1", isCompleted: false), Task(name:"Reserve Freeman Hotel by Diana, as of August 1", isCompleted: false), Task(name:"Purchase plane ticketes by Brandon, as of August 1 ", isCompleted: false), Task(name:"Reserve Freeman Hotel by Diana, as of August 11", isCompleted: false), Task(name:"Reserve Cote by Diana, as of August 21", isCompleted: false)]
    
    @State private var checked = true
    
    var body: some View {
        HStack {
            VStack{
              
                Text("New York City")
                    .font(.title)
                
                Text("September 20-28, 2022")

                
            }
            Button {
            } label: {
                Text("Invite Friends")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(30)
            }
            
        }
        
        VStack{
            List(tasks){ task in
                HStack{
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
        
        
        Spacer()
        
        Button {
        } label: {
            Text("+Add a New Task")
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(30)
        }
        
        
        Spacer()
        
        HStack{
            Text("Car")
            Image(systemName: "􀽜")
            Text("Checklist")
            Image(systemName: "􁙕")
        }

        
        
    }
    
}
