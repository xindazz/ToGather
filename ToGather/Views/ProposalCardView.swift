//
//  ProposalCardView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/9/22.
//

import SwiftUI
import Foundation

struct ProposalCardView: View {
  @ObservedObject var repo: UserRepository
  var proposal: Proposal
  var formatter = CustomDateFormatter()
  
  @State var approveClicked = false
  @State var editableProposal: Proposal = Proposal.example
  
  func generateEditableProposal() {
    editableProposal = Proposal(id: proposal.id, day: proposal.day, newEvent: proposal.newEvent, proposer: proposal.proposer, votes: proposal.votes, replies: proposal.replies)
  }
  
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
        HStack {
          VStack (alignment: .leading, spacing: 10) {
            Text("WHAT: \(proposal.newEvent.name ?? "No name")")
              .font(.headline)
            Text("CATEGORY: \(proposal.newEvent.category ?? "No category")")
              .font(.subheadline)
            Text("WHERE: \(proposal.newEvent.location ?? "")")
          }
          Spacer()
          if repo.trips[repo.currTripIdx].owner.id == repo.user.id {
            NavigationLink(destination: UpdateProposalView(repo: repo, proposal: proposal)) {
              Label("Edit", systemImage: "pencil")
                .foregroundColor(.yellow)
            }.onTapGesture {
              generateEditableProposal()
            }
          }
        }
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
        
        HStack {
          Spacer()
          Button {
            let newVote = Vote(voter: repo.user, vote: VoteStatus.Yes)
            var newProposal = Proposal(id: proposal.id, day: proposal.day, newEvent: proposal.newEvent, proposer: proposal.proposer, votes: proposal.votes, replies: proposal.replies)
            newProposal.addVote(vote: newVote)
            repo.trips[repo.currTripIdx].updateProposal(proposal: newProposal)
            repo.updateTrip(trip: repo.trips[repo.currTripIdx])
          } label: {
            Text("Yes (\(proposal.numYesVotes()))")
              .font(.headline)
              .padding()
              .foregroundColor(.white)
              .frame(width: 150, height: 50)
              .background(proposal.alreadyVoted(user: repo.user) ? .gray : .blue)
              .clipShape(RoundedRectangle(cornerRadius: 12))
          }
          .padding()
          .disabled(proposal.alreadyVoted(user: repo.user) ? true : false)
          Spacer()
          Button {
            let newVote = Vote(voter: repo.user, vote: VoteStatus.No)
            var newProposal = Proposal(id: proposal.id, day: proposal.day, newEvent: proposal.newEvent, proposer: proposal.proposer, votes: proposal.votes, replies: proposal.replies)
            newProposal.addVote(vote: newVote)
            repo.trips[repo.currTripIdx].updateProposal(proposal: newProposal)
            repo.updateTrip(trip: repo.trips[repo.currTripIdx])
          } label: {
            Text("No (\(proposal.numNoVotes()))")
              .font(.headline)
              .padding()
              .foregroundColor(.white)
              .frame(width: 150, height: 50)
              .background(proposal.alreadyVoted(user: repo.user) ? .gray : .blue)
              .clipShape(RoundedRectangle(cornerRadius: 12))
          }
          .padding()
          .disabled(proposal.alreadyVoted(user: repo.user) ? true : false)
          
          Spacer()
        }
        
        NavigationLink(destination: CreateReplyView(repo: repo, proposal: proposal)) {
          Label("Add Reply", systemImage: "arrowshape.turn.up.left")
            .font(.headline)
            .padding()
            .foregroundColor(.white)
            .frame(width: 350, height: 50)
            .background(Color(UIColor.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }.padding()
        
        
        if repo.trips[repo.currTripIdx].owner.id == repo.user.id {
          Button {
            repo.tabSelection = 1
            repo.trips[repo.currTripIdx].approveProposal(proposal: proposal)
            repo.updateTrip(trip: repo.trips[repo.currTripIdx])
//            repo.load()
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
    ProposalCardView(repo: UserRepository(), proposal: Proposal.example)
  }
}
