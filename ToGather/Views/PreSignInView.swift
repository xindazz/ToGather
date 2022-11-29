//
//  PreSignInView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/29/22.
//

import SwiftUI

struct PreSignInView: View {
  @ObservedObject var repo: UserRepository
  var body: some View {
    VStack{
      Text("Welcome to ToGather")
        .font(.title)
        .padding()
      NavigationView {
        VStack {
          NavigationLink(destination: SignUpView(repo: repo)) {
            Button(action: {}) {
              Text("Sign Up")
                .font(.headline)
                .foregroundColor(.white)
            }
            .frame(width: 310, height:50)
            .background(Color(UIColor.systemMint))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(5)
          } //end navlink
          NavigationLink(destination: SignInView(repo: repo)) {
            Button(action: {}) {
              Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
            }
            .frame(width: 310, height:50)
            .background(Color(UIColor.systemMint))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(5)
          } //end navlink
        }
      }
    }
  }
}

struct PreSignInView_Previews: PreviewProvider {
  static var previews: some View {
    PreSignInView(repo: UserRepository())
  }
}
