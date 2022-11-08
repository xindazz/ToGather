//
//  ChecklistOne.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//


import Foundation


import SwiftUI




struct ChecklistOne: View {



    var body: some View {

            
        ZStack {

            VStack(spacing: 40) {
                Text("Welcome, Janey!")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .font(.body).padding(60)


                Text("Your Trips")

                        
                Spacer()

                    Button {
                    } label: {
                      Text("New York City (Sep 20-28, 2022)")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .frame(width: 200, height: 200, alignment: .center)

                    }
                Button {
                } label: {
                  Text("Disney World California (Dec 23-29, 2022)")
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

