//
//  Dashboard.swift
//  ToGather
//
//  Created by Lisa Leung on 11/3/22.
//

import SwiftUI

struct DashboardView: View {
//  using code from SwiftRepos - 443 lab - to start
  
  var body: some View {
//    trip header and nav
//    MARK: break down everything below into sub-files later
//    MARK: members block
//    MARK: trip details block
//    category name
//    VStack (alignment: .leading){
//      Text("Tuesday, November 1 at 12:00pm to Friday, November 11 at 11:00am" ).font(.headline)
//      Text("Fly to LAX from LGA").font(.subheadline)
//      Text("Category: Travel").font(.subheadline)
//    }
//    VStack (alignment: .leading){
//      Text("Tuesday, November 1 at 12:00pm to Friday, November 11 at 11:00am" ).font(.headline)
//      Text("WHAT: Fly to LAX from LGA").font(.subheadline)
//      Text("Category: Travel").font(.subheadline)
//      Text("WHERE: 1 World Way, Los Angeles, CA 90045")
//      Text("WHO: All group members")
//      Text("HOW-MUCH: $300 - $500 per round-trip ticket")
//      Text("WHY: Cheapest flight on Skyscanner with Spirit Airlines")
//      Text("[SkyScanner](https://www.skyscanner.com/)")
    
    VStack (alignment: .leading) {
      Spacer()
      Text("Members")
      Spacer()
      Text("Trip Details")
      Text("Travel")
     
      Button(action: {}) {
          Label("Add Trip Details", systemImage: "plus.circle")
          .buttonStyle(.bordered)
      }

      Spacer()
      Spacer()
      VStack (alignment: .leading){
        Text("Tuesday, November 1 at 12:00pm to Friday, November 11 at 11:00am" ).font(.headline)
        Text("WHAT: Fly to LAX from LGA").font(.subheadline)
        Text("Category: Travel").font(.subheadline)
        Text("WHERE: 1 World Way, Los Angeles, CA 90045")
        Text("WHO: All group members")
        Text("HOW-MUCH: $300 - $500 per round-trip ticket")
        Text("WHY: Cheapest flight on Skyscanner with Spirit Airlines")
        Text("[SkyScanner](https://www.skyscanner.com/)")
        Image("ben-den-engelsen-unsplash")
          .resizable()
          .scaledToFit()
        Spacer()
      }
      
    } //end vstack
    
  } //end body
  
 
} //end struct

struct DashboardView_Previews: PreviewProvider {
  static var previews: some View {
    DashboardView()
  }
}
