//
//  OnboardingTwo.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//


import Foundation
import SwiftUI




struct OnboardingTwo: View {
  @ObservedObject var repo = UserRepository()
  @State private var name: String = "Bob"
  @State private var destination: String = "LA"
  
  @ViewBuilder


    var body: some View {

            
        ZStack {

            VStack(spacing: 40) {
                Text("Let's add a trip")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .font(.body).padding(60)


                Text("We're looking forward to travelling with you, Janey")

                        
                Spacer()

                NavigationLink(destination: OnboardingThree(repo: repo)) {
                      Button(action: {}) {
                         Spacer()
                        Text("Create a Trip")
                             .font(.headline)
                             .padding()
                             .foregroundColor(.white)
                         Spacer()
                      } // end button
                       .frame(width: 300, height:150)
                       .background(Color(UIColor.systemBlue))
                       .clipShape(RoundedRectangle(cornerRadius: 12))
                       .padding(10)
                } // end navlink
                NavigationLink(destination: JoinTripView(repo: repo)) {
                      Button(action: {}) {
                         Spacer()
                        Text("Join an Existing Trip")
                             .font(.headline)
                             .padding()
                             .foregroundColor(.white)
                         Spacer()
                      } // end button
                       .frame(width: 300, height:150)
                       .background(Color(UIColor.systemBlue))
                       .clipShape(RoundedRectangle(cornerRadius: 12))
                       .padding(10)
                } // end navlink
                
                Spacer()
                
            }
        }
    }
}
struct OnboardingTwo_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingTwo()
  }
}
