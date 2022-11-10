//
//  TestTripDetailsRowView.swift
//  ToGather
//
//  Created by Lisa Leung on 11/4/22.
//

import SwiftUI

struct TestTripDetailsRowView: View {
// MARK: FOR TESTING PURPOSES ONLY - based off of SwiftRepos Lab
  var activity: TestTripActivity
  
  var body: some View {
    VStack {
      
      VStack (alignment: .leading, spacing: 20){
        Text(activity.whenActivity ?? "").font(.headline)
        
        Text(activity.whatActivity).font(.subheadline)
        Text(activity.category).font(.subheadline)
        Text(activity.whereActivity ?? "")
        Text(activity.whoActivity ?? "")
        Text(activity.howActivity ?? "")
        // iterate through a list of links
        Text(activity.linkActivity ?? "")
        // iterate through a list of images (somehow)
        Image("skyscanner-lax-to-lga")
          .resizable()
          .scaledToFit()
        Spacer()
      } // end VStack L 17
      .padding(.leading, 20)
    } // end VStack L15
  } // end body
} //end struct

struct TestTripDetailsRowView_Previews: PreviewProvider {
  static var previews: some View {
    TestTripDetailsRowView(activity: TestTripActivity.example0)
  }
}
