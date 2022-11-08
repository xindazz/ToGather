//
//  OnboardingThree.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//


import Foundation
import SwiftUI


struct OnboardingThree: View {
  
  @ObservedObject var repo: UserRepository
  
  @State private var name = ""
  @State private var destination = ""
  @State private var startDate = Date()
  @State private var endDate = Date()
  
  var body: some View {
    
    VStack {
      
      VStack{
        
        Text("Create a trip")
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .font(.headline)
        
        Text("Add whatever details you've figured out (you can go back and change this later)")
        
        Text("Trip Name")
          .font(.title)
          .fontWeight(.bold)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        TextField("Graduation!", text: $name)
          .textContentType(.givenName).border(Color.gray.opacity(0.5))
        
        Text("Destination")
          .font(.title)
          .fontWeight(.bold)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        TextField("New York", text: $destination)
          .textContentType(.givenName).border(Color.gray.opacity(0.5))
        
        Text("Dates")
          .frame(maxWidth: .infinity, alignment: .leading)
        
        DatePicker(selection: $startDate, label: { Text("Start Date") })
        
        DatePicker(selection: $endDate, label: { Text("End Date") })
        
      } // end VStack
      
      Button {
//        let uniqueCode = repo.getUniqueCode()
        repo.createTrip(trip: Trip(name: name, uniqueCode: "", owner: repo.user, destination: destination, from: startDate, to: endDate))
      } label: {
        Text("Create Trip")
          .font(.title)
          .padding()
          .foregroundColor(.white)
          .background(Color.blue)
          .cornerRadius(30)
      }
      
      Spacer()
      
      Button {
        print("Invite friends button clicked")
      } label: {
        Text("Invite Friends")
          .font(.title)
          .padding()
          .foregroundColor(.white)
          .background(Color.blue)
          .cornerRadius(30)
      }
      
    } // end VStack
    
    Spacer()
    
  } // end body
  
}
