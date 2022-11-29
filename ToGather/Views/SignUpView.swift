//
//  SignUpView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/29/22.
//

import SwiftUI
import Firebase

struct SignUpView: View {
  
  @ObservedObject var repo: UserRepository
//
//  @ObservedObject var viewController = ViewController()
  @State var inputTemp: String = ""
  
  @State private var username = ""
  @State private var email = ""
  @State private var password = ""
  @State private var passwordConfirmation = ""
  
  @State var signUpProcessing = false
  @State var errorText = ""
  
  func signUpUser() {
    signUpProcessing = true
    
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
      guard error == nil else {
        signUpProcessing = false
        print("Error in creating user: \(error)")
        errorText = error?.localizedDescription ?? ""
        return
      }
      
      switch authResult {
      case .none:
        print("Could not create account.")
        errorText = ""
        signUpProcessing = false
      case .some(_):
        let user = Auth.auth().currentUser
        if let user = user {
          let uid = user.uid
          repo.setUserWithID(id: uid, name: username, email: email)
        }
        signUpProcessing = false
        errorText = ""
        repo.signedIn = true
        repo.loadUser()
        print("User created")
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
          Text("Name")
            .font(.body)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
          
          TextField("User name", text: $username)
            .textContentType(.givenName).border(Color.gray.opacity(0.5))
          
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
          
          SecureField("Confirm Password", text: $passwordConfirmation)
            .border(Color.gray.opacity(0.5))
            .border(Color.red, width: passwordConfirmation != password ? 1 : 0)
        }
        
        Button {
          signUpUser()
        } label: {
          Spacer()
          Text("Get Started")
            .font(.headline)
            .padding()
            .foregroundColor(.white)
          Spacer()
        } // end button
        .background(Color(UIColor.systemBlue))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty && password == passwordConfirmation ? false : true)
        
        if signUpProcessing {
          ProgressView()
        }
        
        if !errorText.isEmpty {
          Text(errorText)
            .foregroundColor(.red)
        }

      } // Vstack
      
      Spacer()
      
      
    } // ZStack
    .padding()
  } // body
  
} // Struct


struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView(repo: UserRepository())
  }
}
