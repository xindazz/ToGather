//
//  Home.swift
//  ToGather
//
//  Created by Lisa Leung on 11/8/22.
//
import SwiftUI

struct Home: View {
  @ObservedObject var repo = UserRepository()
  @State private var name: String = "Bob"
  @State private var destination: String = "LA"
  
  @ViewBuilder
  var body: some View {
// MARK: what the page should be + some direct links to pre-existing data to make this a smooth process
    
// MARK: this file will be what is displayed in AppView

    VStack (alignment: .leading) {
      ZStack {

         VStack {
//           Text("Welcome, \(repo.user.name)!")
//             .fontWeight(.heavy)
//             .multilineTextAlignment(.center)
//             .font(.headline)

           Spacer()
           
           NavigationView {
             VStack {
               Spacer()
               Text("Welcome to ToGather!")
                 .font(.title)
               Text("Let's go on a trip together")
                 .font(.subheadline)
  //             List{
  //               ForEach(repo.trips) { trip in
  //                 NavigationLink(destination: TestDashboardIntegratedView(trip: trip)) {
  //                   Text("\(trip.name)")
  //                 }
  //               }
  //             }
  //             .navigationBarTitle("Your Trips")
               
               Spacer()
  // MARK: tackle log-in next sprint
               
               NavigationLink(destination: JoinTripView(repo: repo)) {
                 Text("Create Account")
               }
               NavigationLink(destination: OnboardingThree(repo: repo)) {
                 Text("Create Trip")
               }
               
               NavigationLink(destination: JoinTripView(repo: repo)) {
                 Text("SHORTCUT: Proposal Feature ")
               }
               NavigationLink(destination: JoinTripView(repo: repo)) {
                 Text("Join Existing Trip")
               }
             }
           }
           
           Spacer()
         }
     }
      
    } //end vstack
    
  } //end body
  
 
} //end struct

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
