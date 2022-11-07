//
//  DesignSystemComponents.swift
//  ToGather
//
//  Created by Lisa Leung on 11/3/22.
//

import SwiftUI

struct DesignSystemComponentsView: View {
//  using code from SwiftRepos - 443 lab - to start
  
  var body: some View {
    VStack (alignment: .leading) {
      ZStack {
          Color.black.ignoresSafeArea()
          //add all content here
//     MARK: Button Styling
        VStack {
/**
 https://stackoverflow.com/questions/59014158/swiftui-how-to-get-a-view-with-perfectly-rounded-corners
 */
          Button(action: {}) {
             Spacer()
              Label("Some Content", systemImage: "plus.circle")
                 .font(.headline)
                 .padding()
                 .foregroundColor(.white)
             Spacer()
          }
           .background(Color(UIColor.systemBlue))
           .clipShape(RoundedRectangle(cornerRadius: 12))
           .padding()
        } // end vstack
          

      } //end Zstack


      
    } //end vstack
    
  } //end body
  
 
} //end struct

struct DesignSystemComponentsView_Previews: PreviewProvider {
  static var previews: some View {
    DesignSystemComponentsView()
  }
}
