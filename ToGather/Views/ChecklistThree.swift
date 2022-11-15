//
//  ChecklistThree.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//




import Foundation

import SwiftUI
//MARK:- Radio Button Field



struct ChecklistThree: View {
    

    
    
    @State private var textFieldContent = ""
    @State private var textFieldContent2 = ""
    
    
    @State var value = ""
    var placeholder = "Select Client"
    var dropDownList = ["PSO", "PFA", "AIR", "HOT"]
    
        
        
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
            
                
                
                Text("Add a New Task to the Checklist")
                
                
                VStack{
                    
                    Text("What")
                    Text("(Example:Purchase plane tickets)")
                    TextField("Enter an activity", text: $textFieldContent)
                        .textContentType(.givenName).border(Color.gray.opacity(0.5))
                    
                    
                }
                
                VStack{
                    
                    Text("When")
                    Text("(August 10 at 11am to 12pm)")
                    DatePicker(selection: .constant(Date())
                               , label: { Text("Choose Date") })
                    
                    
                }
                
                
                VStack{
                    
                    Text("Who")
                    TextField("Diana", text: $textFieldContent)
                        .textContentType(.givenName).border(Color.gray.opacity(0.5))
                    
                    Menu {
                        ForEach(dropDownList, id: \.self){ client in
                            Button(client) {
                                self.value = client
                            }
                        }
                    } label: {
                        VStack(spacing: 5){
                            HStack{
                                Text(value.isEmpty ? placeholder : value)
                                    .foregroundColor(value.isEmpty ? .gray : .black)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Color.orange)
                                    .font(Font.system(size: 20, weight: .bold))
                            }
                            .padding(.horizontal)
                            Rectangle()
                                .fill(Color.orange)
                                .frame(height: 2)
                        }
                    }
                }
                
                
                
                
                
                Button {
                } label: {
                    Text("Submit")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                }
                
            }
            
        }
        
    


