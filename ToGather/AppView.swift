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
    
    ZStack {

       VStack {
         Text("Welcome, \(repo.user.name)!")
           .fontWeight(.heavy)
           .multilineTextAlignment(.center)
           .font(.headline)

         Spacer()
         
         NavigationView {
           VStack {
             List{
               ForEach(repo.trips) { trip in
                 NavigationLink(destination: TestDashboardIntegratedView(trip: trip)) {
                   Text("\(trip.name)")
                 }
               }
             }.navigationBarTitle("Your Trips")
             
             Spacer()
             
             NavigationLink(destination: OnboardingThree(repo: repo)) {
               Text("Create Trip")
             }
           }
         }
         
         Spacer()
       }
   }
      
  }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
