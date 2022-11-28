//
//  TripView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/9/22.
//

import SwiftUI

struct TripView: View {
  var trip: Trip
  var repo: UserRepository
  
  var body: some View {
    TabView {
    
    // MARK: this dashboardview is a placeholder => it is not yet connected to the database
      TestDashboardIntegratedView(repo: repo, trip: trip)
      .tabItem {
          Image(systemName: "airplane.departure")
          Text("Dashboard")
      }
      YourProposalsView(repo: repo, trip: trip)
      .tabItem {
          Image(systemName: "text.bubble.fill")
          Text("Your Proposals")
      }
//      YourChecklistsView(repo: repo, trip: trip)
//      .tabItem {
//          Image(systemName: "list.bullet.rectangle")
//          Text("Your Checklists")
//      }
      
    } // end TabView
  }
}



struct TripView_Previews: PreviewProvider {
  static var previews: some View {
    TripView(trip: Trip.example, repo: UserRepository())
  }
}







