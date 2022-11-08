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


//    VStack {
//      Text("Placeholder for tab views")
//    }
    TabView {
     
// MARK: this dashboardview is a placeholder => it is not yet connected to the database
      DashboardView()
      .tabItem {
          Image(systemName: "barcode")
          Text("Scan Price")
      }

      UserTripsView()
      .tabItem {
          Image(systemName: "list.dash")
          Text("Saved Scans")
      }
      ChecklistOne()
      .tabItem {
          Image(systemName: "barcode")
          Text("Scan Price")
      }
      
    } // end TabView
    .background(Color(UIColor.black))

  } //end body
  
 
} //end struct

struct BarNavigation_Previews: PreviewProvider {
  static var previews: some View {
    BarNavigation()
  }
}
