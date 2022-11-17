//
//  ChecklistOne.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//


import Foundation


import SwiftUI




struct ChecklistOne: View {
    var repo: UserRepository
    var trip: Trip


    var body: some View {
        NavigationView{
            
        ZStack {

            VStack(spacing: 40) {
                Text("Welcome, \(repo.user.name)!")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .font(.body).padding(60)


                Text("Your Trips")

                        
                Spacer()

                 
            
//                Text("New York City (Sep 20-28, 2022)")

                NavigationLink(trip.name, destination: ChecklistTwo(repo: repo, trip: trip))

                    .font(.title)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 200)
                    .background(Color.blue)
                    .background(Color(UIColor.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()


                
//
//                Button {
//                } label: {
//                  Text("Disney World California (Dec 23-29, 2022)")
//                        .font(.title)
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.blue)
//                        .frame(width: 200, height: 200, alignment: .center)
//
//                }
                
                
                
        //                    NavigationLink(trip.destination + String(trip.from), destination: ChecklistTwo(repo: repo, trip: trip))
        //                            .font(.title)
        //                            .font(.title)
        //                            .foregroundColor(.white)
        //                            .padding()
        //                            .frame(width: 300, height: 200)
        //                            .background(Color.blue)
        //                            .background(Color(UIColor.systemBlue))
        //                            .clipShape(RoundedRectangle(cornerRadius: 12))
        //                            .padding()
                            
        
                
                
                Spacer()
                
            }
        }
    }
}

