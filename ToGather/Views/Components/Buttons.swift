//
//  Buttons.swift
//  ToGather
//
//  Created by Lisa Leung on 11/8/22.
//
import SwiftUI

struct Buttons: View {
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


    } //end scroll view
    
    
  } //end body
  
 
} //end struct

struct Buttons_Previews: PreviewProvider {
  static var previews: some View {
    Buttons()
  }
}
