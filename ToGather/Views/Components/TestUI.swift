//
//  TestUI.swift
//  ToGather
//
//  Created by Lisa Leung on 11/7/22.
//
import SwiftUI

struct TestUI: View {
//  using code from SwiftRepos - 443 lab - to start
  
  var body: some View {
//    trip header and nav
//    MARK: UI-SPECIFIC: use this
//    MARK: break down everything below into sub-files later


    ScrollView {     
//    MARK: wide buttons
      VStack {
        Button(action: {}) {
           Spacer()
          Label("Add Trip Details", systemImage: "plus.circle")
               .font(.headline)
               .padding()
               .foregroundColor(.white)
           Spacer()
        }.frame(width: 300, height:200)
         .background(Color(UIColor.systemBlue))
         .clipShape(RoundedRectangle(cornerRadius: 12))
         .padding()

      } //end Vstack

// MARK: template card + replies
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
        .padding(.leading, 20)
        
        HStack {
          Button(action: {}) {
            Spacer()
            Label("Reply", systemImage: "arrowshape.turn.up.left")
              .font(.headline)
              .padding()
              .foregroundColor(.white)
            Spacer()
          }
          .frame(width: 325, height: 50)
          .background(Color(UIColor.systemBlue))
          .clipShape(RoundedRectangle(cornerRadius: 12))
        } //end HStack
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
          
      } // end VStack
      .background(Color(UIColor.systemGray))
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
      
// MARK: exploring the replies
      
      
      
    } //end scroll view
    
    
  } //end body
  
 
} //end struct

struct TestUI_Previews: PreviewProvider {
  static var previews: some View {
    TestUI()
  }
}
