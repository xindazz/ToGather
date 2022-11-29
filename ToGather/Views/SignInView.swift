//
//  SignInView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/29/22.
//

import SwiftUI
import Firebase

struct SignInView: View {
  @ObservedObject var repo: UserRepository
  
  @State var email = ""
  @State var password = ""
  
  @State var signInProcessing = false
  @State var signInErrorMessage = ""
  
  func signInUser() {
    signInProcessing = true
    
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
      guard error == nil else {
        signInProcessing = false
        signInErrorMessage = error!.localizedDescription
        return
      }
      switch authResult {
      case .none:
        print("Could not sign in user.")
        signInProcessing = false
      case .some(_):
        print("User signed in")
        signInProcessing = false
        signInErrorMessage = ""
        let user = Auth.auth().currentUser
        if let user = user {
          let uid = user.uid
          repo.userId = uid
        }
        repo.signedIn = true
        repo.loadUser()
        print("User signed in")
      }
      
    }
    
  }
  
  @ViewBuilder
  var body: some View {
    
    ZStack {
      
      VStack(alignment: .leading, spacing: 40) {
        Text("Welcome to ToGather")
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .font(.title)
        Text("Let's go on a trip together")
        
        VStack {
          Text("Email")
            .font(.body)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
          
          TextField("123@gmail.com", text: $email)
            .textContentType(.givenName).border(Color.gray.opacity(0.5))
          
          Text("Password")
            .font(.body)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
          
          SecureField("Password", text: $password)
            .border(Color.gray.opacity(0.5))
          
        }
        
        Button {
          signInUser()
        } label: {
          Spacer()
          Text("Sign In")
            .font(.headline)
            .padding()
            .foregroundColor(.white)
          Spacer()
        } // end button
        .background(Color(UIColor.systemBlue))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .disabled(!signInProcessing && !email.isEmpty && !password.isEmpty ? false : true)
        
        if signInProcessing {
          ProgressView()
        }
        
        if !signInErrorMessage.isEmpty {
          Text(signInErrorMessage)
            .foregroundColor(.red)
        }

      } // Vstack
      
      Spacer()
      
    } // ZStack
    .padding()
  } // body
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
      SignInView(repo: UserRepository())
    }
}
