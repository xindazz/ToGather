
//Onboarding Four -- Invite Trip members


import Foundation
import SwiftUI


struct OnboardingFour: View {

    
    @ObservedObject var repo: UserRepository

    @State private var textFieldContent = ""
    @State private var textFieldContent2 = ""

    
    var body: some View {
        
        
        
        TabView {
            VStack {
                
                
                
                
                    ZStack {
        
                        VStack (spacing: 20){
        
        
                            Text("Invite Your Trip Members")
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.center)
                                .font(.body).padding(20)
        
        
        
        
        
                            Text("Unique Code").padding(40)
        
        
                            Text("1 3 6 9 12 15")
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .center).padding(40)
        
        
        
                            Button {
                            } label: {
                                Text("Share Link With Friends")
                                    .font(.title)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(30)
                            }
        
        
                            Text("Friends added!")
                            Button {
                            } label: {
                                Text("Start Planning")
                                    .font(.title)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(30)
                            }
                        }
                    }
                
                
                
                Divider()
                Spacer()
                // Bleeds into TabView
                Rectangle()


            }
            .background(Color("blue"))
            
            }
        }
    }
    

