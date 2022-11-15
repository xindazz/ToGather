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
        VStack {
          Text("Create a trip")
            .font(.title)
//            .fontWeight(.heavy)
//            .multilineTextAlignment(.center)
//            .font(.headline)
          
          Text("Add whatever details you've figured out (you can go back and change this later).")
            .font(.body)
        }
        
        VStack (alignment: .leading){
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
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 15))

        
        
      } // end VStack
      
      Button {
//        let uniqueCode = repo.getUniqueCode()
        var newTrip = Trip(name: name, uniqueCode: "", owner: repo.user, destination: destination, from: startDate, to: endDate)
        newTrip.addMember(user: repo.user)
        repo.createTrip(trip: newTrip)
      } label: {
        Text("Create Trip")
          .frame(width: 350, height:50)
          .font(.headline)
          .foregroundColor(.white)
          .background(Color(UIColor.systemBlue))
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding(5)
      }
//      NavigationLink(destination: JoinTripView(repo: repo)) {
//        Button(action: {}) {
//            Text("Join Trip")
//               .font(.headline)
//               .foregroundColor(.white)
//        }
//         .frame(width: 310, height:50)
//         .background(Color(UIColor.systemMint))
//         .clipShape(RoundedRectangle(cornerRadius: 12))
//         .padding(5)
//      } //end navlink
      Spacer()
      
      Button {
        print("Invite friends button clicked")

//        let uniqueCode = repo.getUniqueCode()
        repo.createTrip(trip: Trip(name: name, uniqueCode: "", owner: repo.user, destination: destination, from: startDate, to: endDate))
      } label: {
        Text("Invite Friends")
          .frame(width: 350, height:50)
          .font(.headline)
          .foregroundColor(.white)
          .background(Color(UIColor.systemBlue))
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding(5)
      }
      
//      Button {
//        print("Invite friends button clicked")
//      } label: {
//        Text("Invite Friends")
//          .font(.title)
//          .padding()
//          .foregroundColor(.white)
//          .background(Color.blue)
//          .cornerRadius(30)
//      }
//      
    } // end VStack
    
    Spacer()
    
  } // end body
  
}

