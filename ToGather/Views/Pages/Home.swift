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
               
               NavigationLink(destination: JoinTripView(repo: repo)) {
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
               NavigationLink(destination: JoinTripView(repo: repo)) {
                     Button(action: {}) {
                        Spacer()
                       Text("Join an Existing Trip")
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
