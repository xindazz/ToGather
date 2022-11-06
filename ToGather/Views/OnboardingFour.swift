//
//  OnboardingFour.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//

import Foundation

import SwiftUI


struct OnboardingFour: View {
    
    
    
    @State private var textFieldContent = ""
    @State private var textFieldContent2 = ""
    
    
    var body: some View {
        
        ZStack {
            
            VStack{
                
                
                Text("Create a trip")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .font(.body)
                
                
                Text("Add whatever details you've figured out (you can go back and change this later)")
                
                
                Text("Trip Name")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                TextField("Graduation!", text: $textFieldContent)
                    .textContentType(.givenName).border(Color.gray.opacity(0.5))
                
                
                Text("Destination")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                TextField("New York", text: $textFieldContent2)
                    .textContentType(.givenName).border(Color.gray.opacity(0.5))
                
                
                Text("Dates")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Choose Date") })
                
                
                Spacer()
                
                
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
                Button {
                } label: {
                    Text("Create Trip")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                }
            }
        
            
            Spacer()
        
        }
    }

