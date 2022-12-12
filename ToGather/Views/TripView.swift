//
//  TripView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/9/22.
//

import SwiftUI

struct TripView: View {
  @ObservedObject var repo: UserRepository
  var trip: Trip
    
  var body: some View {
    TabView(selection: $repo.tabSelection) {
    
    // MARK: this dashboardview is a placeholder => it is not yet connected to the database
      DashboardView(repo: repo)
      .tabItem {
          Image(systemName: "airplane.departure")
          Text("Dashboard")
      }.tag(1)
      YourProposalsView(repo: repo)
      .tabItem {
          Image(systemName: "text.bubble.fill")
          Text("Your Proposals")
      }.tag(2)
      YourProfileView(repo: repo)
        .tabItem {
            Image(systemName: "person.circle")
            Text("Profile")
        }.tag(3)
//      MARK: the checklist feature is out-of-scope
//      YourChecklistsView()
//      .tabItem {
//          Image(systemName: "list.bullet.rectangle")
//          Text("Your Checklists")
//      }.tag(3)
      
    } // end TabView
  }
}

struct TripView_Previews: PreviewProvider {
  static var previews: some View {
    TripView(repo: UserRepository(), trip: Trip.example)
  }
}
