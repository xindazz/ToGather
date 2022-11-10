//
//  EventCard.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/10/22.
//

import SwiftUI

struct EventCard: View {
  
  var event: Event
  var formatter = CustomDateFormatter()
  
  var body: some View {
    VStack (alignment: .leading) {
      VStack (alignment: .leading, spacing: 20) {
        Text("\(formatter.toDateTimeDay(event.from)) to")
          .font(.subheadline)
          .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
        Text("\(formatter.toDateTimeDay(event.to))")
          .font(.subheadline)
          .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
        Divider()
      } // end vstack
      .background(Color(UIColor.systemBlue))
      .foregroundColor(.white)
      
      VStack (alignment: .leading, spacing: 10){
        Text("WHAT: \(event.name)")
          .font(.headline)
        Text("CATEGORY: \(event.category)")
          .font(.subheadline)
        Text("WHERE: \(event.location ?? "")")
//        Text("WHO: All group members")
//        Text("HOW-MUCH: $300 - $500 per round-trip ticket")
//        Text("WHY: Cheapest flight on Skyscanner with Spirit Airlines")
        Text("[SkyScanner](https://www.skyscanner.com/)")
        Image("skyscanner-lax-to-lga")
          .resizable()
          .scaledToFit()
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
        
      }
      .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0))
      
    } //end vstack
    .background(Color(UIColor.lightGray))
    .clipShape(RoundedRectangle(cornerRadius: 12))
    .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
  }
}

struct EventCard_Previews: PreviewProvider {
  static var previews: some View {
    EventCard(event: Event.example)
  }
}
