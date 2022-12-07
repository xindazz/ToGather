//
//  CreateReplyView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/10/22.
//

import SwiftUI

struct CreateReplyView: View {
  @ObservedObject var repo: UserRepository
  var proposal: Proposal
  
  @State private var detail = ""
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    
    VStack {
      
      ScrollView{
        // MARK: form stack (sorry for the obnoxious number of stacks, this is to avoid the stack capacity issue
        VStack{
          //        MARK: text input for now, should *DEFINITELY* be a dropdown later for data integrity
          VStack {
            Text("Comment")
              .font(.title)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Details", text: $detail)
              .textContentType(.givenName).border(Color.gray.opacity(0.5))
          }
          
        }
        
      } // end VStack
            
      Button {
        let newReply = Reply(replier: repo.user, comment: detail)
        var newProposal = Proposal(id: proposal.id, day: proposal.day, newEvent: proposal.newEvent, proposer: proposal.proposer, votes: proposal.votes, replies: proposal.replies)
        newProposal.addReply(reply: newReply)
        repo.trips[repo.currTripIdx].updateProposal(proposal: newProposal)
        repo.updateTrip(trip: repo.trips[repo.currTripIdx])
//        repo.load()
        repo.tabSelection = 2
        self.presentationMode.wrappedValue.dismiss()
      } label: {
        Text("Add Reply")
          .font(.subheadline)
          .padding()
          .foregroundColor(.white)
          .background(Color.blue)
          .cornerRadius(30)
      }
      
    } // end VStack
    
    Spacer()
    
  } // 
}

struct CreateReplyView_Previews: PreviewProvider {
    static var previews: some View {
      CreateReplyView(repo: UserRepository(), proposal: Proposal.example)
    }
}
