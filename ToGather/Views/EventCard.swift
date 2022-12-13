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
          .font(.custom("NunitoSans-Regular", size: 16))

//          .font(.subheadline)
          .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
        Text("\(formatter.toDateTimeDay(event.to))")
          .font(.custom("NunitoSans-Regular", size: 16))

//          .font(.subheadline)
          .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
        //            Divider()
      } // end vstack
      
      //          removed ?? "" from lines 61 and 63 (following two text lines) to deal with compilation error raised)
      VStack (alignment: .leading, spacing: 10){
        Text("\(event.name)")
//          .font(.headline)
          .font(.custom("NunitoSans-SemiBold", size: 24))

        Text("\(event.category)")
          .font(.custom("NunitoSans-Light", size: 18))

//          .font(.subheadline)
        
        Text("\(event.location ?? "")")
          .font(.custom("NunitoSans-Regular", size: 18))
          .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))


        Text("\(event.detail ?? "")")
          .font(.custom("NunitoSans-Regular", size: 18))

        Text("\(event.link ?? "")")
          .font(.custom("NunitoSans-Regular", size: 18))

        //        Text("Proposed by: \(event.proposer.name)")
        //          .fontWeight(.light)
      }
      .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 10))
      
      
    } //end vstack
    //        .background(Color(UIColor.lightGray))
    //        .clipShape(RoundedRectangle(cornerRadius: 12))
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 160))
    .background(
      Rectangle()
        .fill(Color.white)
        .frame(width: 375)
        .cornerRadius(12)
        .shadow(
          color: Color.gray.opacity(0.7),
          radius: 8,
          x: 0,
          y: 0
        )
    )
    //    VStack (alignment: .leading) {
    //      VStack (alignment: .leading) {
    //        Text("\(formatter.toDateTimeDay(event.from)) to")
    //          .font(.subheadline)
    //          .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
    //        Text("\(formatter.toDateTimeDay(event.to))")
    //          .font(.subheadline)
    //          .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
    //        Divider()
    //      } // end vstack
    //      .background(Color(UIColor.systemBlue))
    //      .foregroundColor(.white)
    //
    //      VStack (alignment: .leading, spacing: 10){
    //        Text("\(event.name)")
    //          .font(.headline)
    //        Text("\(event.category)")
    //          .font(.subheadline)
    //        Text("\(event.location ?? "")")
    //        Text("\(event.detail ?? "")")
    //        Text("\(event.link ?? "")")
    ////        Text("WHAT: \(event.name)")
    ////          .font(.headline)
    ////        Text("CATEGORY: \(event.category)")
    ////          .font(.subheadline)
    ////        Text("WHERE: \(event.location ?? "")")
    ////        Text("WHO: All group members")
    ////        Text("HOW-MUCH: $300 - $500 per round-trip ticket")
    ////        Text("WHY: Cheapest flight on Skyscanner with Spirit Airlines")
    ////        Text("[SkyScanner](https://www.skyscanner.com/)")
    ////        Image("skyscanner-lax-to-lga")
    ////          .resizable()
    ////          .scaledToFit()
    ////          .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
    //
    //      } // end Vstack
    //      .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0))
    //
    //    } //end vstack
    //    .background(Color(UIColor.lightGray))
    //    .clipShape(RoundedRectangle(cornerRadius: 12))
    //    .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
    //  }
    //}
  } //end body
} //end struct

struct EventCard_Previews: PreviewProvider {
  static var previews: some View {
    EventCard(event: Event.example)
  }
}
