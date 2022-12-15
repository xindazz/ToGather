//
//  BarNavigation.swift
//  ToGather
//
//  Created by Lisa Leung on 11/8/22.
//

import SwiftUI

struct BarNavigation: View {

  
  var body: some View {
//    trip header and nav
//    MARK: UI-SPECIFIC: use this
//    MARK: break down everything below into sub-files later

// MARK: add background color to the tab view
    TabView {
    
    // MARK: this dashboardview is a placeholder => it is not yet connected to the database
      YourTripsView(repo: UserRepository())
      .tabItem {
          Image(systemName: "airplane.departure")
          Text("Your Trips")
      }
      
    } // end TabView
        

  } //end body
  
 
} //end struct

struct BarNavigation_Previews: PreviewProvider {
  static var previews: some View {
    BarNavigation()
  }
}
