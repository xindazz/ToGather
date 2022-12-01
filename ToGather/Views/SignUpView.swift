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
        
        
        VStack{
            
            VStack(alignment: .leading) {
                Text("Welcome to ToGather")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding(EdgeInsets(top: 60, leading: 40, bottom: 0, trailing: 10))
                
                
                
                Text("Let's go on a trip together")
                    .padding(EdgeInsets(top: 5, leading: 80, bottom: 0, trailing: 10))
                
                
                VStack {
                    Text("Name")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 10))
                    
                    
                    TextField("User name", text: $username)
                        .textContentType(.givenName).border(Color.gray.opacity(0.5))
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))
                    
                    Text("Email")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 10))
                    
                    
                    TextField("123@gmail.com", text: $email)
                        .textContentType(.givenName).border(Color.gray.opacity(0.5))
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))
                    
                    Text("Password")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 10))
                    
                    
                    SecureField("Password", text: $password)
                        .border(Color.gray.opacity(0.5))
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))
                    
                    
                    SecureField("Confirm Password", text: $passwordConfirmation)
                        .border(Color.gray.opacity(0.5))
                        .border(Color.red, width: passwordConfirmation != password ? 1 : 0)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))
                    
                    
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
                        .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 10))
                    
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
            
            
        }
    } // body
    
    // Struct
}


struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView(repo: UserRepository())
  }
}
