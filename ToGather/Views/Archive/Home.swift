//
//  Home.swift
//  ToGather
//
//  Created by Lisa Leung on 11/8/22.
//  page for demo testing
import SwiftUI

struct Home: View {
  @ObservedObject var repo = UserRepository()
//  MARK: can't show the dash yet because of this
//  @ObservedObject var trip = Trip()
  
  @State private var name: String = "Bob"
  @State private var destination: String = "LA"
  
  @ViewBuilder
  var body: some View {
//    VStack {
//      Text(repo.user.name)
//      Text(repo.user.handle ?? "")
//      Text(repo.user.phone ?? "")
//      List {
//        ForEach(repo.trips) { trip in
//          Text(trip.name)
//        }
//      }
//      TextField("Enter trip name", text: $name)
//      TextField("Enter trip destination", text: $destination)
//      Button(action: {
//        let trip = Trip(name: name, owner: repo.user, destination: destination)
//        repo.createTrip(trip: trip)
//        }) {
//        Text("Create trip")
//      }
//    }
//    MARK: Changed this a default log-in page with shortcuts :)
    ZStack {

       VStack {
         Text("Welcome, \(repo.user.name)!")
           .fontWeight(.heavy)
           .multilineTextAlignment(.center)
           .font(.headline)

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
// MARK: tackle log-in next sprint

             Spacer()
             NavigationLink(destination: OnboardingOne()) {
               Button(action: {}) {
                  Spacer()
                 Text("Create an Account")
                      .font(.headline)
                      .padding()
                      .foregroundColor(.white)
                  Spacer()
               } // end button
                .frame(width: 300, height:150)
                .background(Color(UIColor.systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(10)
             } //end navlink
             
//               NavigationLink({}) {
               Button(action: {}) {
                  Spacer()
                 Text("Log In [in-development]")
                      .font(.headline)
                      .padding()
                      .foregroundColor(.white)
                  Spacer()
               } // end button
                .frame(width: 300, height:150)
                .background(Color(UIColor.systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(10)
//               } // end navlink
             // MARK: CORRECT BUTTON
//             NavigationLink(destination: TestDashboardIntegratedView(trip:trip)) {
//               Button(action: {}) {
//                  Spacer()
//                 Text("SHORTCUT: View a Pre-Existing Trip (Proposal Feature)")
//                      .font(.headline)
//                      .padding()
//                      .foregroundColor(.white)
//                  Spacer()
//               } // end button
//                .frame(width: 300, height:150)
//                .background(Color(UIColor.systemBlue))
//                .clipShape(RoundedRectangle(cornerRadius: 12))
//                .padding(10)
//             } // end navlink
             // MARK: PLACEHOLDER
             NavigationLink(destination: Dashboard()) {
               Button(action: {}) {
                  Spacer()
                 Text("SHORTCUT: View a Pre-Existing Trip (Proposal Feature)")
                      .font(.headline)
                      .padding()
                      .foregroundColor(.white)
                  Spacer()
               } // end button
                .frame(width: 300, height:150)
                .background(Color(UIColor.systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(10)
             } // end navlink
             
//             NavigationLink(destination: JoinTripView(repo: repo)) {
//               Text("Create Account")
//             }
//             NavigationLink(destination: OnboardingThree(repo: repo)) {
//               Text("Create Trip")
//             }
//
//             NavigationLink(destination: JoinTripView(repo: repo)) {
//               Text("SHORTCUT: Proposal Feature ")
//             }
//             NavigationLink(destination: JoinTripView(repo: repo)) {
//               Text("Join Existing Trip")
//             }
           } //  end vstack
         } // end navigation view
         
         Spacer()
       }
   }
      
  }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
