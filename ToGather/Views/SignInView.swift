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
    VStack {
      VStack(alignment: .leading, spacing: 40) {
        VStack {
          Text("Email")
            .font(.custom("NunitoSans-SemiBold", size: 24))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.white)
          
          TextField(" 123@gmail.com", text: $email)
            .textContentType(.givenName).border(Color.gray.opacity(0.5))
            .background(Color(.white))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
          
          Text("Password")
            .font(.custom("NunitoSans-SemiBold", size: 24))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.white)
          
          SecureField(" Password", text: $password)
            .textContentType(.givenName).border(Color.gray.opacity(0.5))
            .background(Color(.white))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
        } // end vstack
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        Button {
          signInUser()
        } label: {
          Text("Sign In")
            .frame(width: 350, height:50)
            .font(.custom("NunitoSans-Bold", size: 18))
            .foregroundColor(.white)
            .background(Color("primary"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
            .disabled(!signInProcessing && !email.isEmpty && !password.isEmpty ? false : true)
          
        }
        if signInProcessing {
          ProgressView()
            .frame(maxWidth: .infinity, alignment: .center)
        }
        
        if !signInErrorMessage.isEmpty {
          Text(signInErrorMessage)
            .foregroundColor(.red)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        
        Spacer()
      }
      .background(Color("blue"))
      
    }
    
  }
  
}


struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView(repo: UserRepository())
  }
}
