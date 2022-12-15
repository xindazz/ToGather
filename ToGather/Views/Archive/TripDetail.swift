//
//  TripDetail.swift
//  ToGather
//
//  Created by Lisa Leung on 11/3/22.
//
import SwiftUI

struct TripDetailView: View {
//  using code from SwiftRepos - 443 lab - to start
  
  var body: some View {
//    MARK: trip details block
//    category name
//    VStack (alignment: .leading){
//      Text("Tuesday, November 1 at 12:00pm to Friday, November 11 at 11:00am" ).font(.headline)
//      Text("Fly to LAX from LGA").font(.subheadline)
//      Text("Category: Travel").font(.subheadline)
//    }
    VStack (alignment: .leading){
      Text("Tuesday, November 1 at 12:00pm to Friday, November 11 at 11:00am" ).font(.headline)
      Text("WHAT: Fly to LAX from LGA").font(.subheadline)
      Text("Category: Travel").font(.subheadline)
      Text("WHERE: 1 World Way, Los Angeles, CA 90045")
      Text("WHO: All group members")
      Text("HOW-MUCH: $300 - $500 per round-trip ticket")
      Text("WHY: Cheapest flight on Skyscanner with Spirit Airlines")
      Text("[SkyScanner](https://www.skyscanner.com/)")
    }
    
  } //end body
  
 
} //end struct

struct TripDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TripDetailView()
  }
}
