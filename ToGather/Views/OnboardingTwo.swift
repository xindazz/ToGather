//
//  OnboardingTwo.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//


import Foundation
import SwiftUI




struct OnboardingTwo: View {



    var body: some View {

            
        ZStack {

            VStack(spacing: 40) {
                Text("Let's add a trip")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .font(.body).padding(60)


                Text("We're looking forward to travelling with you, Janey")

                        
                Spacer()

                    Button {
                    } label: {
                      Text("Create a Trip")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .frame(width: 200, height: 200, alignment: .center)

                    }
                Button {
                } label: {
                  Text("Join a Trip ")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .frame(width: 200, height: 200, alignment: .center)

                }
                
                Spacer()
                
            }
        }
    }
}
