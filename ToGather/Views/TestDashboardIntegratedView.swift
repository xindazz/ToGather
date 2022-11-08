//
//  TestDashboardIntegratedView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/7/22.
//

import SwiftUI

struct TestDashboardIntegratedView: View {
//  using code from SwiftRepos - 443 lab - to start
  var trip: Trip
  
  var dateFormatter = DateFormatter()
  
  var body: some View {
//    trip header and nav
//    MARK: this uses older dashboard ui for the sake of example
    
// MARK: trip header
    ScrollView {
      VStack (alignment: .leading) {
        Spacer()
        Text(trip.name)
          .font(.largeTitle)
          .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
        HStack {
          Text(trip.from ?? Date(), style: .date)
          Text(" - ")
          Text(trip.to ?? Date(), style: .date)
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        
        Text("Unique code: \(trip.uniqueCode)")
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        
        Divider()
        //    MARK: members block
        VStack (alignment: .leading){
          Text("Members").font(.headline)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          HStack {
            ForEach(trip.members) { member in
              VStack {
                Image("ben-den-engelsen-unsplash")
                  .resizable()
                  .scaledToFit()
                  .clipShape(Circle())
                  .frame(width: 100, height: 100)
                VStack(alignment: .trailing) {
                  Text(member.name)
                    .font(.caption)
                } //end VStack
              } //end VStack
            } //end ForEach
          }//end hstack
          .padding(EdgeInsets(top: -10, leading: 20, bottom: 10, trailing: 0))
        } // end vstack
        
        //    MARK: trip details block
        VStack (alignment: .leading){
          Text("Trip Details").font(.title)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
          
          Button(action: {}) {
            Spacer()
            Label("Add Trip Details", systemImage: "plus.circle")
              .font(.headline)
              .padding()
              .foregroundColor(.white)
            Spacer()
          }
          .background(Color(UIColor.systemBlue))
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding()
          
          
          Text("Category").font(.title2)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          Spacer()
          Spacer()
            VStack (alignment: .leading){
              ForEach(trip.itinerary) { day in
                VStack (alignment: .leading, spacing: 20) {
                  Text("Day \(day.dayNum)").font(.headline)
                  
                  Text(dateFormatter.string(from: day.date)).font(.subheadline)
                  VStack {
                    ForEach(day.events) { event in
                      VStack (alignment: .leading){
                        Text(event.name).font(.headline)
                        Text(event.category).font(.subheadline)
                        Text(event.location ?? "")
                        Text(event.detail ?? "")
                        Text(event.link ?? "")
                        //                      Text((event.price ?? 0).description)
                        // iterate through a list of images (somehow)
                        Image("skyscanner-lax-to-lga")
                          .resizable()
                          .scaledToFit()
                        Spacer()
                      } // end VStack
                    } // end ForEach
                  } // end Vstack
                  .padding(.leading, 20)
                } // end VStack
              } // end ForEach
              
            } // end VStack
          Spacer()
        } // end VStack
        Spacer()
      } //end vstack
    }
  } //end body
  
 
} //end struct

//
//struct TestDashboardIntegratedView_Previews: PreviewProvider {
//  static var previews: some View {
//    TestDashboardIntegratedView(trip: TestTrips.example)
//  }
//}

