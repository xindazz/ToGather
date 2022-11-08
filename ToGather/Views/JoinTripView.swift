//
//  JoinTripView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/8/22.
//

import Foundation
import SwiftUI


struct JoinTripView: View {
  
  @ObservedObject var repo: UserRepository
  @State private var code = ""
  
  var body: some View {
    
    VStack {
      Text("Join a trip")
        .fontWeight(.heavy)
        .multilineTextAlignment(.center)
        .font(.headline)
      
      Text("Enter Unique Code")
        .font(.title)
        .fontWeight(.bold)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      TextField("123456", text: $code)
        .textContentType(.givenName).border(Color.gray.opacity(0.5))
        
      Button {
        repo.joinTrip(code: code)
      } label: {
        Text("Join Trip")
          .font(.title)
          .padding()
          .foregroundColor(.white)
          .background(Color.blue)
          .cornerRadius(30)
      }
      
    } // end VStack
    
    
  } // end body
  
}


