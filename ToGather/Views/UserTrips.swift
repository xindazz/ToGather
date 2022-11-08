//
//  UserTrips.swift
//  ToGather
//
//  Created by Lisa Leung on 11/8/22.
//

import SwiftUI

struct UserTripsView: View {
//  using code from SwiftRepos - 443 lab - to start
  
  var body: some View {
//    trip header and nav
//    MARK: UI-SPECIFIC: use this
//    MARK: break down everything below into sub-files later

// MARK: trip header
    VStack (alignment: .leading) {
      VStack (alignment: .leading){
        Text("View all Trips")
          .font(.largeTitle)
          .padding(EdgeInsets(top: 10, leading: 80, bottom: 0, trailing: 0))

        Divider()
      }
//    MARK: members block
      ScrollView {
        VStack (alignment: .leading){
          Text("Members").font(.headline)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          HStack {
            VStack {
              Image("ben-den-engelsen-unsplash")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
              VStack(alignment: .trailing) {
                 Text("Brandon Woo")
                   .font(.caption)
               } //end VStack
            } //end Vstack
            VStack {
              Image("michael-dam-unsplash")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
              VStack(alignment: .trailing) {
                 Text("Diana Prince")
                   .font(.caption)
               } //end VStack
            } //end Vstack
            
          }//end hstack
          .padding(EdgeInsets(top: -10, leading: 20, bottom: 10, trailing: 0))
        } // end vstack
        .frame(maxWidth: .infinity, alignment: .leading)

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

          Text("Travel").font(.title2)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          Spacer()
          Spacer()
          VStack (alignment: .leading) {
            VStack (alignment: .leading, spacing: 20) {
              Text("Tuesday, November 1 at 12:00pm to")
                .font(.subheadline)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
              Text("Friday, November 11 at 11:00am")
                .font(.subheadline)
                .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
              Divider()
            } // end vstack
            .background(Color(UIColor.systemBlue))
            .foregroundColor(.white)
            
            VStack (alignment: .leading, spacing: 10){
              Text("WHAT: Fly to LAX from LGA")
                .font(.headline)
              Text("Category: Travel")
                .font(.subheadline)
              Text("WHERE: 1 World Way, Los Angeles, CA 90045")
              Text("WHO: All group members")
              Text("HOW-MUCH: $300 - $500 per round-trip ticket")
              Text("WHY: Cheapest flight on Skyscanner with Spirit Airlines")
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
          
        } // end VStack
        
      } //end scrollview
      
    } //end vstack
    
  } //end body
  
 
} //end struct

struct UserTripsView_Previews: PreviewProvider {
  static var previews: some View {
    UserTripsView()
  }
}
