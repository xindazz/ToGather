//
//  YourProfileView.swift
//  ToGather
//
//  Created by Lisa Leung on 12/12/22.
//

import Foundation
import SwiftUI

struct YourProfileView: View {
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
          Text("Your Profile for \(repo.trips[repo.currTripIdx].name ?? "Some Trip")")
            .font(.title)
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

struct YourProfileView_Previews: PreviewProvider {
  static var previews: some View {
    YourProfileView(repo: UserRepository())
  }
}

