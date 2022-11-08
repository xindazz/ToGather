//
//  BarNavigation.swift
//  ToGather
//
//  Created by Lisa Leung on 11/8/22.
//

import SwiftUI

struct BarNavigation: View {
//  using code from BigMountainStudio for background
// https://www.bigmountainstudio.com/community/public/posts/86559-how-to-customize-the-tabview-in-swiftui
  
  var body: some View {
//    trip header and nav
//    MARK: UI-SPECIFIC: use this
//    MARK: break down everything below into sub-files later

// MARK: add background color to the tab view
    TabView {
    
// MARK: this dashboardview is a placeholder => it is not yet connected to the database
    
      DashboardView()
      .tabItem {
          Image(systemName: "airplane.departure")
          Text("Your Trips")
      }

      UserTripsView()
      .tabItem {
          Image(systemName: "text.bubble.fill")
          Text("Your Proposals")
      }
      ChecklistOne()
      .tabItem {
          Image(systemName: "list.bullet.rectangle")
          Text("Your Checklists")
      }
      
    } // end TabView
        

  } //end body
  
 
} //end struct

struct BarNavigation_Previews: PreviewProvider {
  static var previews: some View {
    BarNavigation()
  }
}
