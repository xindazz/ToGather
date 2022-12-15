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
          .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
        Text("\(formatter.toDateTimeDay(event.to))")
          .font(.custom("NunitoSans-Regular", size: 16))
          .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
      } // end vstack
      
      VStack (alignment: .leading){
        Text("\(event.name)")
          .font(.custom("NunitoSans-SemiBold", size: 24))

        Text("\(event.category)")
          .font(.custom("NunitoSans-Light", size: 18))
        
        Text("\(event.location ?? "")")
          .font(.custom("NunitoSans-Regular", size: 18))
          .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))


        Text("\(event.detail ?? "")")
          .font(.custom("NunitoSans-Regular", size: 18))

        Text("\(event.link ?? "")")
          .font(.custom("NunitoSans-Regular", size: 18))
      }
      .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 10))
      
      
    } //end vstack
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 160))
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
    
  } //end body
} //end struct

struct EventCard_Previews: PreviewProvider {
  static var previews: some View {
    EventCard(event: Event.example)
  }
}
