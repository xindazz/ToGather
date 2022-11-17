//
//  NewProposalCardView.swift
//  ToGather
//
//  Created by Lisa Leung on 11/17/22.
//

//MARK: made with Paul Hudson's single card view example https://www.hackingwithswift.com/books/ios-swiftui/designing-a-single-card-view

//MARK: experimenting with hiding field values and the replies for trip plan/proposals
import SwiftUI
struct NewProposalCardView: View {
    @State private var isShowingAnswer = false

    let card: Card
    var repo: UserRepository
    var trip: Trip
    var proposal: Proposal
    var formatter = CustomDateFormatter()

    var body: some View {
      ScrollView{
        
        ZStack {
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(.white)
            .shadow(radius: 10)
          
          VStack (alignment: .leading) {
            Text("Proposed by: \(proposal.proposer.name)")
              .font(.headline)
            
            VStack (alignment: .leading, spacing: 20) {
              Text("\(formatter.toDateTimeDay(proposal.newEvent.from)) to")
                .font(.subheadline)
              Text("\(formatter.toDateTimeDay(proposal.newEvent.to))")
                .font(.subheadline)
              Divider()
            } // end vstack
            .background(Color(UIColor.systemBlue))
            .foregroundColor(.white)
            
            if isShowingAnswer {
              Text(card.answer)
                .font(.title)
                .foregroundColor(.gray)
            }
          }// end vstack
          .padding(20)
          .multilineTextAlignment(.center)
        
        } // end zstack
        .frame(width: 375, height: 250)
        .onTapGesture {
          isShowingAnswer.toggle()
        } // end tapgesture
        
        VStack (alignment: .leading) {
          VStack (alignment: .leading){
            Text("Proposed by: \(proposal.proposer.name)")
              .font(.headline)
              .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
            Divider()
          }
            .background(Color(UIColor.systemBlue))
            .foregroundColor(.white)
          
          
          
          VStack (alignment: .leading, spacing: 20) {
            Text("\(formatter.toDateTimeDay(proposal.newEvent.from)) to")
              .font(.subheadline)
              .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
            Text("\(formatter.toDateTimeDay(proposal.newEvent.to))")
              .font(.subheadline)
              .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
            Divider()
          } // end vstack
//          .background(Color(UIColor.systemBlue))
//          .foregroundColor(.white)
          
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
      } //end scrollview
    } // end body
} // end struct

struct NewProposalCardView_Previews: PreviewProvider {
  static var previews: some View {
    NewProposalCardView(card: Card.example, repo: UserRepository(), trip: Trip.example, proposal: Proposal.example)
  }
}
