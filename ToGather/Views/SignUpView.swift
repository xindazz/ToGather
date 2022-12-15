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
        TabView {
            VStack(alignment: .leading) {
//                   Text("Welcome to ToGather")
//                       .fontWeight(.heavy)
//                       .multilineTextAlignment(.center)
//                       .font(.title)
//                       .padding(EdgeInsets(top: 60, leading: 40, bottom: 0, trailing: 10))
//
//                       Text("Let's go on a trip together")
//                           .padding(EdgeInsets(top: 50, leading: 80, bottom: 0, trailing: 10))
       
       
             VStack {
                 Text("Name")
                     .font(.custom("NunitoSans-SemiBold", size: 24))
                     .frame(maxWidth: .infinity, alignment: .leading)
//                     .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                     .foregroundColor(.white)


                 TextField(" Username", text: $username)
                 
                     .textContentType(.givenName).border(Color.gray.opacity(0.5))
                     .background(Color(.white))
                     .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))

//                     .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))


                 
                 
                 
                 Text("Email")
                     .font(.custom("NunitoSans-SemiBold", size: 24))

                     .frame(maxWidth: .infinity, alignment: .leading)
//                     .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 10))
//                     .foregroundColor(.white)

                 TextField(" 123@gmail.com", text: $email)
                     .textContentType(.givenName).border(Color.gray.opacity(0.5))
                     .background(Color(.white))
                     .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))

//                     .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))


                 Text("Password")
                     .font(.custom("NunitoSans-SemiBold", size: 24))
                     .frame(maxWidth: .infinity, alignment: .leading)
//                     .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 10))
//                     .foregroundColor(.white)


                 SecureField(" Password", text: $password)
                     .textContentType(.givenName).border(Color.gray.opacity(0.5))
                     .background(Color(.white))
                     .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))

//                     .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))


                 SecureField(" Confirm Password", text: $passwordConfirmation)
                     .textContentType(.givenName).border(Color.gray.opacity(0.5))
                     .background(Color(.white))
                     .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))

//                     .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))



             } // end vstack
             .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

              Button(action: {signUpUser()}) {
                Text("Get Started")
                  .font(.custom("NunitoSans-Bold", size: 18))
                  .foregroundColor(.white)
              }
              .frame(width: 350, height:50)
              .background(Color("primary"))
              .clipShape(RoundedRectangle(cornerRadius: 12))
              .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
              .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty && password == passwordConfirmation ? false : true)

              if signUpProcessing {
                  ProgressView()
              }

              if !errorText.isEmpty {
                  Text(errorText)
                      .foregroundColor(.red)
              }
// MARK: old button
//                 Button {
//                     signUpUser()
//                 } label: {
//                     Spacer()
//                     Text("Get Started")
//                         .font(.custom("NunitoSans-Bold", size: 18))
//                         .foregroundColor(.white)
//                         .padding()
//                     Spacer()
//                         .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 10))
// 
//                 } // end button
//                 .background(Color("primary"))
//                 .clipShape(RoundedRectangle(cornerRadius: 12))
//                 .padding()
//                 .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty && password == passwordConfirmation ? false : true)
// 
//                 if signUpProcessing {
//                     ProgressView()
//                 }
// 
//                 if !errorText.isEmpty {
//                     Text(errorText)
//                         .foregroundColor(.red)
//                 }
 


//                Divider()
                Spacer()
                // Bleeds into TabView
                Rectangle()
                    .frame(height: 0)
                  
                
            }
            .background(Color("blue"))
            
            
            
            }
        }
    }


    
    
    




struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView(repo: UserRepository())
  }
}
