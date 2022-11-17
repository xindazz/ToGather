//
//  ProposalCardView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/9/22.
//

import SwiftUI
import Foundation

struct ProposalCardView: View {
  var repo: UserRepository
  var trip: Trip
  var proposal: Proposal
  var formatter = CustomDateFormatter()
  
  @ViewBuilder
  var body: some View {
    VStack (alignment: .leading) {
      Text("Proposed by: \(proposal.proposer.name)")
        .font(.headline)
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
      
      VStack (alignment: .leading, spacing: 20) {
        Text("\(formatter.toDateTimeDay(proposal.newEvent.from)) to")
          .font(.subheadline)
          .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
        Text("\(formatter.toDateTimeDay(proposal.newEvent.to))")
          .font(.subheadline)
          .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
        Divider()
      } // end vstack
      .background(Color(UIColor.systemBlue))
      .foregroundColor(.white)
      
      VStack (alignment: .leading, spacing: 10){
        //        Text("New York City Trip - September 2022")
        //          .foregroundColor(.white)
        //          .font(.subheadline)
        //        Divider()
        Text("WHAT: \(proposal.newEvent.name ?? "No name")")
          .font(.headline)
        Text("CATEGORY: \(proposal.newEvent.category ?? "No category")")
          .font(.subheadline)
        Text("WHERE: \(proposal.newEvent.location ?? "")")
        
        VStack (alignment: .leading, spacing: 20) {
          Text("\(formatter.toDateTimeDay(proposal.newEvent.from)) to")
            .font(.subheadline)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
          Text("\(formatter.toDateTimeDay(proposal.newEvent.to))")
            .font(.subheadline)
            .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
          Divider()
        } // end vstack
        .background(Color(UIColor.systemBlue))
        .foregroundColor(.white)
        
        VStack (alignment: .leading, spacing: 10){
          Text("\(proposal.newEvent.name ?? "")")
            .font(.headline)
          Text("\(proposal.newEvent.category ?? "Activity")")
            .font(.subheadline)
          Text("\(proposal.newEvent.location ?? "")")
          Text("\(proposal.newEvent.detail ?? "")")
          Text("\(proposal.newEvent.link ?? "")")
          
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
        
        NavigationLink(destination: CreateReplyView(repo: repo, trip: trip, proposal: proposal)) {
          Label("Add Reply", systemImage: "arrowshape.turn.up.left")
            .font(.headline)
            .padding()
            .foregroundColor(.white)
            .frame(width: 350, height: 50)
            .background(Color(UIColor.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }.padding()
        
        if trip.owner.id == repo.user.id {
          Button {
            var newTrip = Trip(id: trip.id, name: trip.name, uniqueCode: trip.uniqueCode, owner: trip.owner, members: trip.members, destination: trip.destination, from: trip.from, to: trip.to, itinerary: trip.itinerary, proposals: trip.proposals, tasks: trip.tasks)
            newTrip.approveProposal(proposal: proposal)
            repo.updateTrip(trip: newTrip)
            repo.load()
          } label: {
            Text("Approve")
              .foregroundColor(.white)
              .font(.headline)
          }
          .frame(width: 350, height: 50)
          .background(Color(UIColor.systemGreen))
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding()
        }
        
      } //end vstack
      .background(Color(UIColor.lightGray))
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
      
      VStack {
        ForEach (proposal.replies) { reply in
          ReplyCardView(reply: reply)
        }
      }.padding()
      
    } //end VStack
    
  } // end body
}

struct ProposalCardView_Previews: PreviewProvider {
  static var previews: some View {
    ProposalCardView(repo: UserRepository(), trip: Trip.example, proposal: Proposal.example)
  }
}
