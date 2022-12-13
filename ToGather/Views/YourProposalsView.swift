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
  
  @ObservedObject var repo: UserRepository
    
  var body: some View {
    //    trip header and nav
    //    MARK: UI-SPECIFIC: use this
    //    MARK: break down everything below into sub-files later
    
    // MARK: trip header
    NavigationView {
      
      VStack {
        VStack (alignment: .leading){
          Text("Your Proposals for \(repo.trips[repo.currTripIdx].name ?? "Some Trip")")
            .font(.custom("NunitoSans-SemiBold", size: 24))
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          Divider()
        }
                
        ScrollView{
          
          VStack (alignment: .leading) {
            
            ForEach(repo.trips[repo.currTripIdx].proposals) {proposal in
              IntegratedProposalCardView(repo: repo, proposal: proposal)
            }
            
          } // end VStack
          
        } //end scrollview
        
        NavigationLink(destination: CreateProposalView(repo: repo)) {
          Button(action: {}) {
            Text("Create Proposal").font(.headline)
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              .foregroundColor(.white)
          } // end button
          .frame(width: 200.0, height:50)
          .background(Color("secondary"))
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding(10.0)
        } //end navlink
        
      } //end VStack
      
      
    } //end NavView
    
  } //end body
  
  
} //end struct

struct YourProposalsView_Previews: PreviewProvider {
  static var previews: some View {
    YourProposalsView(repo: UserRepository())
  }
}
