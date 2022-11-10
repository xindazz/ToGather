//
//  YourTripsView.swift
//  ToGather
//
//  Created by Lisa Leung on 11/9/22.
//

import SwiftUI

struct YourTripsView: View {
//  using code from SwiftRepos - 443 lab - to start
  @ObservedObject var repo: UserRepository
  
  var body: some View {
    VStack (alignment: .leading) {
      
//      Text("Welcome, Jenny!")
//        .font(.headline)
//        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
//      NavigationLink (destination: Home() {
//        Text("Is this you? Log In.")
//          .font(.caption)
//          .foregroundColor(.blue)
//      }
      
      NavigationView {
        VStack {
          Text("Welcome, \(repo.user.name)!")
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
            .font(.headline)
          Text("Your Trips")
            .font(.title)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
          ScrollView {
            VStack{
              ForEach(repo.trips) { trip in
                NavigationLink(destination: TripView(trip: trip, repo: repo)) {
                  Button(action: {}) {
                    VStack{
                      Text(trip.name)
                        .font(.headline)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        .foregroundColor(.white)
                      Text(trip.from ?? Date(), style: .date)
                        .font(.subheadline)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
                        .foregroundColor(.white)
                    }//end vstack
                  } // end button
                  .frame(width: 300, height:150)
                  .background(Color(UIColor.systemBlue))
                  .clipShape(RoundedRectangle(cornerRadius: 12))
                  .padding(10)
                  
                } //end navlink
              } // end ForEach
            } //end vstack
          } //end ScrollView
          
          HStack {
            NavigationLink(destination: OnboardingThree(repo: repo)) {
              Button(action: {}) {
                Text("Create Trip").font(.headline)
                  .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                  .foregroundColor(.white)
              } // end button
              .frame(width: 120, height:50)
              .background(Color(UIColor.systemGreen))
              .clipShape(RoundedRectangle(cornerRadius: 12))
              .padding(10)
            } //end navlink
            
            NavigationLink(destination: JoinTripView(repo: repo)) {
              Button(action: {}) {
                Text("Join Trip").font(.headline)
                  .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                  .foregroundColor(.white)
              } // end button
              .frame(width: 120, height:50)
              .background(Color(UIColor.systemGreen))
              .clipShape(RoundedRectangle(cornerRadius: 12))
              .padding(10)
            } //end navlink
          }
        }
        
      } //end NavView
      
      HStack {
        Button {
          repo.load()
        } label: {
          Text("Refresh")
        }.frame(maxWidth: .infinity, alignment: .center)
      }
      
    } //end vstack
    
  } //end body
  
 
} //end struct

struct YourTripsView_Previews: PreviewProvider {
  static var previews: some View {
    YourTripsView(repo: UserRepository())
  }
}
