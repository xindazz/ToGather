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
      ZStack {
        Color("secondary").ignoresSafeArea()
        
        ScrollView{
          VStack{
            VStack {
              Text("Comment")
                .font(.custom("NunitoSans-SemiBold", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
              TextField("Details", text: $detail)
                .textContentType(.givenName).border(Color.gray.opacity(0.5))
                .background(Color(.white))
            } // end vstack
             
          } // end vstack
          .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 20))

          
          Button {
            let newReply = Reply(replier: repo.user, comment: detail)
            var newProposal = Proposal(id: proposal.id, day: proposal.day, newEvent: proposal.newEvent, proposer: proposal.proposer, votes: proposal.votes, replies: proposal.replies)
            newProposal.addReply(reply: newReply)
            repo.trips[repo.currTripIdx].updateProposal(proposal: newProposal)
            repo.updateTrip(trip: repo.trips[repo.currTripIdx])
            repo.tabSelection = 2
            self.presentationMode.wrappedValue.dismiss()
          } label: {
            Text("Add Reply")
              .frame(width: 350, height:50)
              .font(.custom("NunitoSans-Bold", size: 18))
              .foregroundColor(.white)
              .background(Color("primary"))
              .clipShape(RoundedRectangle(cornerRadius: 12))
              .padding(5)
              .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
          } // end button
          
          
        } // end scroll
      } //end zstack
      
            
      
      
    } // end VStack
    
    Spacer()
    
  } // 
}

struct CreateReplyView_Previews: PreviewProvider {
    static var previews: some View {
      CreateReplyView(repo: UserRepository(), proposal: Proposal.example)
    }
}
