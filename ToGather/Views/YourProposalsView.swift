//
//  YourProposalsView.swift
//  ToGather
//
//  Created by Lisa Leung on 11/9/22.
//

// MARK: currently a copy of UserTrips

import SwiftUI

struct YourProposalsView: View {
  //  using code from SwiftRepos - 443 lab - to start
  
  var repo: UserRepository
  var trip: Trip
  
  var body: some View {
    //    trip header and nav
    //    MARK: UI-SPECIFIC: use this
    //    MARK: break down everything below into sub-files later
    
    // MARK: trip header
    NavigationView {
      
      VStack {
        VStack (alignment: .leading){
          Text("Your Proposals for NYC Trip")
            .font(.largeTitle)
          Text("September 10-14, 2022")
          Divider()
        }
                
        ScrollView{
          
          VStack (alignment: .leading) {
            //      MARK: Trip header
            
            //        VStack {
            //          // MARK: this page should be the buttons for trips
            //          Text("Your Proposals")
            //            .font(.largeTitle)
            //            .padding()
            //          Divider()
            //        } // end vstack
            
            ForEach(trip.proposals) {proposal in
              ProposalCardView(repo: repo, trip: trip, proposal: proposal)
            }
            
          } // end VStack
          
        } //end scrollview
        
        NavigationLink(destination: CreateProposalView(repo: repo, trip: trip)) {
          Button(action: {}) {
            Text("Create Proposal").font(.headline)
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              .foregroundColor(.white)
          } // end button
          .frame(width: 200.0, height:50)
          .background(Color(UIColor.systemGreen))
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding(10.0)
        } //end navlink
        
      } //end VStack
      
      
    } //end NavView
    
  } //end body
  
  
} //end struct

struct YourProposalsView_Previews: PreviewProvider {
  static var previews: some View {
    YourProposalsView(repo: UserRepository(), trip: Trip.example)
  }
}
