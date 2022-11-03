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

// MARK: trip header
    VStack (alignment: .leading) {
      Spacer()
      Text("NYC Trip")
        .font(.largeTitle)
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
      Text("September 10-14, 2022")
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
      
      Divider()
//    MARK: members block
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
        VStack (alignment: .leading, spacing: 20){
          Text("Tuesday, November 1 at 12:00pm to Friday, November 11 at 11:00am" ).font(.headline)
          
          Text("WHAT: Fly to LAX from LGA").font(.subheadline)
          Text("Category: Travel").font(.subheadline)
          Text("WHERE: 1 World Way, Los Angeles, CA 90045")
          Text("WHO: All group members")
          Text("HOW-MUCH: $300 - $500 per round-trip ticket")
          Text("WHY: Cheapest flight on Skyscanner with Spirit Airlines")
          Text("[SkyScanner](https://www.skyscanner.com/)")
          Image("skyscanner-lax-to-lga")
            .resizable()
            .scaledToFit()
          Spacer()
        } // end VStack
        .padding(.leading, 20)
        
      } // end VStack
      
    } //end vstack
    
  } //end body
  
 
} //end struct

struct DashboardView_Previews: PreviewProvider {
  static var previews: some View {
    DashboardView()
  }
}
