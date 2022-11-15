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
                
                VStack(spacing: 10) {
                    Text("Welcome, \(repo.user.name)!")
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .font(.body).padding(60)
                    
                    
                    Text("Your Trips")
                    
//                    
//                
//                    NavigationLink(trip.name, destination: ChecklistTwo(repo: repo, trip: trip))
//                    
//                        .font(.title)
//                        .font(.title)
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(width: 300, height: 200)
//                        .background(Color.blue)
//                        .background(Color(UIColor.systemBlue))
//                        .clipShape(RoundedRectangle(cornerRadius: 12))
//                        .padding()
                
                    
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
                    
                    
                }
            }
        }
    }
}


struct ChecklistOne_Preview: PreviewProvider {
    static var previews: some View {
        ChecklistOne(repo: UserRepository(), trip: Trip.example)
        
    }
    
}
                     
                     

//                    "\(trip.destination)"
//                    , \(trip.from ?? Date(), style: .date)


//                    NavigationLink(destination: TripView(trip: trip, repo: repo)) {
//                      Button(action: {}) {
//                        VStack{
//                          Text(trip.name)
//                            .font(.headline)
//                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
//                            .foregroundColor(.white)
//                          Text(trip.from ?? Date(), style: .date)
//                            .font(.subheadline)
//                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
//                            .foregroundColor(.white)
//                        }//end vstack
//                      } // end button
//                      .frame(width: 300, height:150)
//                      .background(Color(UIColor.systemBlue))
//                      .clipShape(RoundedRectangle(cornerRadius: 12))
//                      .padding(10)
  
    
