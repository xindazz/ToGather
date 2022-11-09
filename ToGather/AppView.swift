// Created by Prof. H in 2022
// Part of the PriceCheckFB project
// Using Swift 5.0
// Qapla'

import SwiftUI

struct AppView: View {
  @ObservedObject var repo = UserRepository()
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
         
         NavigationLink (destination: Home(repo:repo) {
           Label("Is this you? Log In.")
             .font(.caption)
             .foregroundColor(.blue)
         }
         

//                        label: Spacer()
         // MARK: add background color to the tab view
             TabView {
             
             // MARK: this dashboardview is a placeholder => it is not yet connected to the database
               YourTripsView()
               .tabItem {
                   Image(systemName: "airplane.departure")
                   Text("Your Trips")
               }

               YourProposalsView()
               .tabItem {
                   Image(systemName: "text.bubble.fill")
                   Text("Your Proposals")
               }
               YourChecklistsView()
               .tabItem {
                   Image(systemName: "list.bullet.rectangle")
                   Text("Your Checklists")
               }
               
             } // end TabView
         
         Spacer()
       } //  end Vstack
   } //end ZStack
      
  }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
