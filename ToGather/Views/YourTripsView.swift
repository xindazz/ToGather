//
//  YourTripsView.swift
//  ToGather
//
//  Created by Lisa Leung on 11/9/22.
//

import SwiftUI

struct YourTripsView: View {
//  using code from SwiftRepos - 443 lab - to start
  
  var body: some View {
    VStack (alignment: .leading) {
      Text("Welcome, Jenny!")
        .font(.headline)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))

      Text("Your Trips")
        .font(.title)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))

//      NavigationLink(destination: JoinTripView(repo: repo)) {
        Button(action: {}) {
//          Spacer()
          VStack{
            Text("New York City")
             .font(.headline)
             .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
             .foregroundColor(.white) 
            Text("September 10-24, 2022")
            .font(.subheadline)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
            .foregroundColor(.white)
          }//end vstack
//           Spacer()
        } // end button
         .frame(width: 300, height:150)
         .background(Color(UIColor.systemBlue))
         .clipShape(RoundedRectangle(cornerRadius: 12))
         .padding(10)
      

//      } //end navlink
    } //end vstack
    
  } //end body
  
 
} //end struct

struct YourTripsView_Previews: PreviewProvider {
  static var previews: some View {
    YourTripsView()
  }
}
