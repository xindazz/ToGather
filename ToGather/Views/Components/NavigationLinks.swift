//
//  NavigationLinks.swift
//  ToGather
//
//  Created by Lisa Leung on 11/8/22.
//

import SwiftUI

struct NavigationLinks: View {
  @ObservedObject var repo = UserRepository()
  @State private var name: String = "Bob"
  @State private var destination: String = "LA"
  
  @ViewBuilder
  var body: some View {


    VStack (alignment: .leading) {
      ZStack {

         VStack {
//           MARK: normal chill button
           NavigationLink(destination: OnboardingThree(repo: repo)) {
             Button(action: {}) {
                 Text("Create Trip")
                    .font(.headline)
                    .foregroundColor(.white)
             }
              .frame(width: 310, height:50)
              .background(Color(UIColor.systemMint))
              .clipShape(RoundedRectangle(cornerRadius: 12))
              .padding(5)
           } //end navlink
//           MARK: wide navigation link buttons for home/onboarding
               NavigationLink(destination: JoinTripView(repo: repo)) {
                 Button(action: {}) {
                    Spacer()
                   Text("Create an Account")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                    Spacer()
                 } // end button
                  .frame(width: 300, height:150)
                  .background(Color(UIColor.systemBlue))
                  .clipShape(RoundedRectangle(cornerRadius: 12))
                  .padding(10)
               } //end navlink
          
           
           NavigationLink(destination: JoinTripView(repo: repo)) {
             Button(action: {}) {
                Spacer()
                Text("some text")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                Spacer()
             } // end button
              .background(Color(UIColor.systemBlue))
              .clipShape(RoundedRectangle(cornerRadius: 12))
              .padding()
           } //end navlink
               
           
         }
     } // end ztack
      
    } //end vstack
    
  } //end body
  
 
} //end struct

struct NavigationLinks_Previews: PreviewProvider {
  static var previews: some View {
    NavigationLinks()
  }
}
