//
//  TestDashboardIntegratedView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/7/22.
//

import SwiftUI

struct DashboardView: View {

  @ObservedObject var repo: UserRepository
  
  var dateFormatter = DateFormatter()
  
  var body: some View {
    
    // MARK: trip header
    ScrollView {
      VStack (alignment: .leading) {
        Spacer()
        Text(repo.trips[repo.currTripIdx].name)
          .font(.largeTitle)
          .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
        HStack {
          Text(repo.trips[repo.currTripIdx].from ?? Date(), style: .date)
          Text(" - ")
          Text(repo.trips[repo.currTripIdx].to ?? Date(), style: .date)
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        
        Text("Unique code: \(repo.trips[repo.currTripIdx].uniqueCode)")
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        
        Divider()
        //    MARK: members block
        VStack (alignment: .leading){
          Text("Members").font(.headline)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          HStack {
            ForEach(repo.trips[repo.currTripIdx].members) { member in
              VStack {
                Image("ben-den-engelsen-unsplash")
                  .resizable()
                  .scaledToFit()
                  .clipShape(Circle())
                  .frame(width: 100, height: 100)
                VStack(alignment: .trailing) {
                  Text(member.name)
                    .font(.caption)
                } //end VStack
              } //end VStack
            } //end ForEach
          }//end hstack
          .padding(EdgeInsets(top: -10, leading: 20, bottom: 10, trailing: 0))
        } // end vstack
        
        //    MARK: trip details block
        VStack (alignment: .leading){
          Text("Trip Details").font(.title)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
          
          NavigationLink(destination: CreateProposalView(repo: repo)) {
            Button(action: {}) {
              Text("Create Proposal").font(.headline)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .foregroundColor(.white)
            } // end button
            .frame(width: 300, height:50)
            .background(Color(UIColor.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
          } //end navlink
          
          
          Text("Category").font(.title2)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          Spacer()
          Spacer()
            VStack (alignment: .leading){
              ForEach(repo.trips[repo.currTripIdx].itinerary) { day in
                VStack (alignment: .leading, spacing: 20) {
                  Text("Day \(day.dayNum!)").font(.headline)
                  
                  Text(dateFormatter.string(from: day.date)).font(.subheadline)
                  VStack {
                    ForEach(day.events) { event in
                      VStack (alignment: .leading){
                        EventCard(event: event)
                      } // end VStack
                    } // end ForEach
                  } // end Vstack
                  .padding(.leading, 20)
                } // end VStack
              } // end ForEach
              
            } // end VStack
          Spacer()
        } // end VStack
        Spacer()
      } //end vstack
    }
  } //end body
  
 
} //end struct

