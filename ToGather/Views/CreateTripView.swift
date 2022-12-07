//
//  OnboardingThree.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.


import Foundation
import SwiftUI


struct CreateTripView: View {
  
  @ObservedObject var repo: UserRepository
  
  @State private var name = ""
  @State private var destination = ""
  @State private var startDate = Date()
  @State private var endDate = Date()
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    
    
    TabView {
      
      VStack {
        VStack{
          VStack {
            Text("Create a trip")
              .font(.title)
              .fontWeight(.heavy)
              .multilineTextAlignment(.center)
              .font(.headline)
              .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 10))
            
            Text("Add whatever details you've figured out (you can go back and change this later).")
              .font(.body)
              .multilineTextAlignment(.center)
              .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))
          }
          
          VStack (alignment: .leading){
            Text("Trip Name")
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
              .foregroundColor(.white)
            
            TextField("Graduation!", text: $name)
              .textContentType(.givenName).border(Color.gray.opacity(0.5))
              .background(Color(.white))
            
            Text("Destination")
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
              .foregroundColor(.white)
              .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 10))
            
            TextField("New York", text: $destination)
              .textContentType(.givenName).border(Color.gray.opacity(0.5))
              .background(Color(.white))
            
            Text("Dates")
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 10))
              .foregroundColor(.white)
            
            DatePicker(selection: $startDate, label: { Text("Start Date") })
              .foregroundColor(.white)
            
            DatePicker(selection: $endDate, label: { Text("End Date") })
              .foregroundColor(.white)
            
          } // end VStack
          .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 15))
        }
        
        Button {
          //        let uniqueCode = repo.getUniqueCode()
          var newTrip = Trip(name: name, uniqueCode: "", owner: repo.user, destination: destination, from: startDate, to: endDate)
          newTrip.addMember(user: repo.user)
          repo.createTrip(trip: newTrip)
          self.presentationMode.wrappedValue.dismiss()
        } label: {
          Text("Create Trip")
            .frame(width: 350, height:50)
            .font(.headline)
            .foregroundColor(.white)
            .background(Color("buttoncolor"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(5)
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 10))
        }
        
        NavigationLink("Invite Friends", destination: OnboardingFour(repo: repo))
          .font(.title)
          .padding()
          .foregroundColor(.white)
          .frame(width: 350, height: 80)
          .background(Color("darkblue"))
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding(EdgeInsets(top: 35, leading: 20, bottom: 0, trailing: 10))
        
        
        Spacer()
        // Bleeds into TabView
        Rectangle()
          .frame(height: 0)
      }
      
      .background(Color("blue"))
      
    }
  }
  
}



struct CreateTripView_Previews: PreviewProvider {
  static var previews: some View {
    CreateTripView(repo: UserRepository())
  }
}








