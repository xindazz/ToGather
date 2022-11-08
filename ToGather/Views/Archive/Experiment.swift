//
//  Experiment.swift
//  ToGather
//
//  Created by Lisa Leung on 11/3/22.
//

import SwiftUI

struct Experiment: View {
//  using code from SwiftRepos - 443 lab - to start
  
  var body: some View {
    VStack (alignment: .leading) {
      ZStack {
          Color.black.ignoresSafeArea()
          //add all content here
//     MARK: Button Styling
        VStack {
          Button(action: {}) {
              Label("Add Trip Details", systemImage: "plus.circle")
              .font(.headline)
              .clipShape(RoundedRectangle(cornerRadius: 12))
              .padding()
              .background(.yellow)
          }
          Button(action: {}) {
          Text("I'm a Button")
              .padding(.horizontal, 10)
              .background(Color.red)
              .clipShape(Capsule())
          }
/**
 https://stackoverflow.com/questions/59014158/swiftui-how-to-get-a-view-with-perfectly-rounded-corners
 */
          Button(action: {
                         // Do whatever
                     }) {
                         Spacer()
                         Text("Log In")
                             .font(.title2)
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

struct Experiment_Previews: PreviewProvider {
  static var previews: some View {
    Experiment()
  }
}
