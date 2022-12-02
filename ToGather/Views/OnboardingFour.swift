//
//  OnboardingFour.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//
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
        
                        VStack {
        
        
                            Text("Invite Your Trip Members")
                                .font(.title)
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                                .font(.body).padding(20)
                                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 10))

        
        
        
        
                            Text("Unique Code").padding(40)
                                .foregroundColor(.white)

        
                            Text("1 3 6 9 12 15")
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .center).padding(40)
                                .foregroundColor(.white)

        
        
                            Button {
                            } label: {
                                Text("Share Link With Friends")
                                
                                    .font(.title)
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(width: 350, height: 80)
                                
                                    .background(Color("darkblue"))
                                
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                
                                    .padding(EdgeInsets(top: 45, leading: 20, bottom: 0, trailing: 10))
                                
                                
                            }
        
        
                            Text("Friends added!")
                                .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 10))

                            Button {
                            } label: {
                                Text("Start Planning")
                                    .frame(width: 350, height:50)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .background(Color("buttoncolor"))                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .padding(5)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                                
                            }
                        }
                    }
                
     
        
                Spacer()
                // Bleeds into TabView
             


            }
            .background(Color("blue"))
            
            }
        }
    }


struct OnboardingFour_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingFour(repo: UserRepository())
  }
}
