//
//  NewProposalCardView.swift
//  ToGather
//
//  Created by Lisa Leung on 11/17/22.
//

//MARK: made with Paul Hudson's single card view example https://www.hackingwithswift.com/books/ios-swiftui/designing-a-single-card-view

// MARK: made with Jayesh Kawli's shadow tutorial https://jayeshkawli.ghost.io/adding-shadows-to-swiftui-views/


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
//        MARK: adapted sample
//        ZStack {
//          RoundedRectangle(cornerRadius: 10, style: .continuous)
//            .fill(.white)
//            .shadow(radius: 10)
//
//          VStack (alignment: .leading) {
//            Text("Proposed by: \(proposal.proposer.name)")
//              .font(.headline)
//
//            VStack (alignment: .leading, spacing: 20) {
//              Text("\(formatter.toDateTimeDay(proposal.newEvent.from)) to")
//                .font(.subheadline)
//              Text("\(formatter.toDateTimeDay(proposal.newEvent.to))")
//                .font(.subheadline)
////              Divider()
//            } // end vstack
//            .background(Color(UIColor.systemBlue))
//            .foregroundColor(.white)
//
//            if isShowingAnswer {
//              Text(card.answer)
//                .font(.title)
//                .foregroundColor(.gray)
//            }
//          }// end vstack
//          .padding(20)
//          .multilineTextAlignment(.center)
//
//        } // end zstack
//        .frame(width: 375, height: 250)
//        .onTapGesture {
//          isShowingAnswer.toggle()
//        } // end tapgesture
//        MARK: in-progress new card
        VStack (alignment: .leading) {
          VStack (alignment: .leading, spacing: 20) {
            Text("\(formatter.toDateTimeDay(proposal.newEvent.from)) to")
              .font(.subheadline)
              .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
            Text("\(formatter.toDateTimeDay(proposal.newEvent.to))")
              .font(.subheadline)
              .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
//            Divider()
          } // end vstack
          
//          removed ?? "" from lines 61 and 63 (following two text lines) to deal with compilation error raised)
          VStack (alignment: .leading, spacing: 10){
            Text("\(proposal.newEvent.name)")
              .font(.headline)
            Text("\(proposal.newEvent.category)")
              .font(.subheadline)
            
            Text("\(proposal.newEvent.location ?? "")")
            Text("\(proposal.newEvent.detail ?? "")")
            Text("\(proposal.newEvent.link ?? "")")
            Text("Proposed by: \(proposal.proposer.name)")
              .fontWeight(.light)
          }
          .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 10))
          HStack{ //yes/no hstack
            Button(action: {}) {
               Spacer()
              Label("Yes [10]", systemImage: "hand.thumbsup")
                   .font(.headline)
                   .padding()
                   .foregroundColor(.white)
               Spacer()
            }
            .frame(width: 160)
             .background(Color(UIColor.systemBlue))
             .clipShape(RoundedRectangle(cornerRadius: 12))
             .padding()
            Button(action: {}) {
               Spacer()
              Label("No [4]", systemImage: "hand.thumbsdown")
                   .font(.headline)
                   .padding()
                   .foregroundColor(.white)
               Spacer()
            }
            .frame(width: 160)
             .background(Color(UIColor.systemBlue))
             .clipShape(RoundedRectangle(cornerRadius: 12))
             .padding()
          } // end hstack
          
          NavigationLink(destination: CreateReplyView(repo: repo, proposal: proposal)) {
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
//        .background(Color(UIColor.lightGray))
//        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(EdgeInsets(top: 10, leading: 50, bottom: 0, trailing: 50))
        .background(
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 375)
                    .cornerRadius(12)
                    .shadow(
                        color: Color.gray.opacity(0.7),
                        radius: 8,
                        x: 0,
                        y: 0
                    )
        )
      } //end scrollview
    } // end body
} // end struct

struct NewProposalCardView_Previews: PreviewProvider {
  static var previews: some View {
    NewProposalCardView(card: Card.example, repo: UserRepository(), trip: Trip.example, proposal: Proposal.example)
  }
}
