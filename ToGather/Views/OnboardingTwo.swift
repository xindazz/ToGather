//
//  OnboardingTwo.swift
//  testing
//
//  Created by Yi  on 11/2/22.
//

import Foundation


import Foundation
import SwiftUI



struct OnboardingTwo: View {
    
    
    var body: some View {
        
        
        
        ZStack {
            
            VStack(spacing: 30) {
                Text("Let's add a trip")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .font(.body)
                
                
                Text("We're looking forward to travelling with you, Janey")
                

                

                NavigationLink("Create a Trip", destination: OnboardingThree())
                    .font(.title)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 200)
                    .background(Color.blue)
                    .background(Color(UIColor.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                }
                }


                
                
                
                                NavigationLink("Join a Trip", destination: OnboardingThree())
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width: 300, height: 200)
                                    .background(Color.blue)
                                    .background(Color(UIColor.systemBlue))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .padding()
                                }
                                }
                
                
                
            
