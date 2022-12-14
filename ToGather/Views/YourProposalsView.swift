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
    
    // MARK: trip header
    
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.white, Color("reply"), Color("secondary")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
      
      VStack {
        VStack (alignment: .leading, spacing: 5){
          Text("Proposals for \(repo.trips[repo.currTripIdx].name)")
            .font(.custom("NunitoSans-SemiBold", size: 24))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 10, leading: 75, bottom: 0, trailing: 20))
          //            Divider()
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
            Label("Create a Proposal", systemImage: "plus.circle")
            //                .font(.headline)
              .font(.custom("NunitoSans-Bold", size: 18))
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              .foregroundColor(.white)
          } // end button
          .frame(width: 300, height:50)
          .background(Color("primary"))
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        } //end navlink
        
      } //end VStack
      
      
    } //end zstack
    
    
  } //end body
  
  
} //end struct

struct YourProposalsView_Previews: PreviewProvider {
  static var previews: some View {
    YourProposalsView(repo: UserRepository())
  }
}
