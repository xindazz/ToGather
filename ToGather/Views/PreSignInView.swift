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
    ZStack{
      Color("primary").ignoresSafeArea()
      VStack{
        Text("Welcome to ToGather")
          .font(.title)
          .padding()
        NavigationView {
          ZStack {
            Color("primary").ignoresSafeArea()

            VStack {
              NavigationLink(destination: SignUpView(repo: repo)) {
                Button(action: {}) {
                  Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                }
                .frame(width: 310, height:50)
                .background(Color("secondary"))
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
                .background(Color("secondary"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(5)
              } //end navlink
            } //end vstack
          } //end Zstack
          
         
        } // end navview
        
      } //end vstack

    } //end Zstack

  } // end body
} // end struct

struct PreSignInView_Previews: PreviewProvider {
  static var previews: some View {
    PreSignInView(repo: UserRepository())
  }
}
