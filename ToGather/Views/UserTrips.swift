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
    ScrollView{
      
      VStack (alignment: .leading) {
        VStack {
          // MARK: this page should be the buttons for trips
          Text("Proposal")
            .font(.largeTitle)
            .padding()
          Divider()
        } // end vstack
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
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 10))
          
          HStack {
            Button(action: {}) {
              Spacer()
              Label("Reply", systemImage: "arrowshape.turn.up.left")
                .font(.headline)
                .padding()
                .foregroundColor(.white)
              Spacer()
            }
            .frame(width: 350, height: 50)
            .background(Color(UIColor.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 12))
          } //end HStack
          .padding()
          
        } //end vstack
        .background(Color(UIColor.lightGray))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
        
      } // end VStack
      
        // MARK: insert replies
        VStack (alignment: .leading){
          VStack (alignment: .leading){
            //          Text("Sender: Brandon Woo")
            Label("Sender: Brandon Woo", systemImage: "arrowshape.turn.up.left")
            
            Divider()
          }
          .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
          VStack (alignment: .leading, spacing: 10){
            Text("Category: WHAT")
              .font(.headline)
            Text("Fly from DCA to LAX")
            Text("Category: Comment")
              .font(.headline)
            Text("Cheaper than flying from LGA in NYC ")
          }
          .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
          
        }
        .frame(width: 300, height: .infinity)
        .background(Color(UIColor.systemGreen))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(EdgeInsets(top: 10, leading: 90, bottom: 20, trailing: 15))
        
      } //end vstack
      
    } // end scrollview

    
  } //end body
  
 
//} //end struct

struct UserTripsView_Previews: PreviewProvider {
  static var previews: some View {
    UserTripsView()
  }
}
