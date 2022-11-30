


//Onboarding One slide on Figma -- Creating an account



import Foundation
import SwiftUI




struct OnboardingOne: View {
    
    //    @ObservedObject var repo: UserRepository
    
    //    @ObservedObject var viewController = ViewController()
    @State var inputTemp: String = ""
    
    @State private var textFieldContent = ""
    @State private var textFieldContent2 = ""
    
    
    
    @State var contact = ""
    
    var body: some View {
        
        
        
        TabView {

            
            
            
            VStack(alignment: .leading, spacing: 40) {
                
                Text("Welcome to ToGather")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .font(.body)
                
                
                Text("Let's go on a trip together")
                
                
                Text("Name")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                //                    MARK: could not replace with user model code
                
                TextField("User name", text: $textFieldContent)
                    .textContentType(.givenName).border(Color.gray.opacity(0.5))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                
                
                Text("Password")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                //                    MARK: could not replace with user model code
                TextField("pass", text: $textFieldContent2)
                    .textContentType(.givenName).border(Color.gray.opacity(0.5))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                
                
                Divider()
                Spacer()
                // Bleeds into TabView
                Rectangle()
                    .frame(height: 0)
                
                
            }
            .background(Color.purple)
            
        }
        }
    }

    
