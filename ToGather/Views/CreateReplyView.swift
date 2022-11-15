//
//  CreateReplyView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/10/22.
//

import SwiftUI

struct CreateReplyView: View {
  @ObservedObject var repo: UserRepository
  var trip: Trip
  var proposal: Proposal
  
//  @State private var name = ""
//  @State private var category = ""
//  @State private var location = ""
//  @State private var startDate = Date()
//  @State private var endDate = Date()
  @State private var detail = ""
//  @State private var link = ""
//  @State private var price = 0
  
  var body: some View {
    
    VStack {
      
      ScrollView{
        // MARK: form stack (sorry for the obnoxious number of stacks, this is to avoid the stack capacity issue
        VStack{
          //        MARK: text input for now, should *DEFINITELY* be a dropdown later for data integrity
//          VStack {
//            Text("Category")
//              .font(.title)
//              .fontWeight(.bold)
//              .frame(maxWidth: .infinity, alignment: .leading)
//            TextField("Food/Drink", text: $category)
//              .textContentType(.givenName).border(Color.gray.opacity(0.5))
//          }
//
//          VStack {
//            Text("What")
//              .font(.title)
//              .fontWeight(.bold)
//              .frame(maxWidth: .infinity, alignment: .leading)
//            Text("Example: Street food from Queen's Night Market")
//              .font(.subheadline)
//            TextField("Event name", text: $name)
//              .textContentType(.givenName).border(Color.gray.opacity(0.5))
//          }
//
//          VStack {
//            Text("Location")
//              .font(.title)
//              .fontWeight(.bold)
//              .frame(maxWidth: .infinity, alignment: .leading)
//            TextField("123 Main St.", text: $location)
//              .textContentType(.givenName).border(Color.gray.opacity(0.5))
//          }
//
//          VStack {
//            Text("Dates")
//              .frame(maxWidth: .infinity, alignment: .leading)
//            //                  MARK: @Xinda, replace $startData & $endDate the field names (i think it's from and to)
//            DatePicker(selection: $startDate, label: { Text("Start Date") })
//            DatePicker(selection: $endDate, label: { Text("End Date") })
//          }
          
          VStack {
            Text("Comment")
              .font(.title)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Details", text: $detail)
              .textContentType(.givenName).border(Color.gray.opacity(0.5))
          }
          
//          VStack {
//            Text("Link")
//              .font(.title)
//              .fontWeight(.bold)
//              .frame(maxWidth: .infinity, alignment: .leading)
//            TextField("http://", text: $link)
//              .textContentType(.givenName).border(Color.gray.opacity(0.5))
//          }
          
        }
        
      } // end VStack
            
      Button {
//        let newEvent = Event(name: name, category: category, location: location, from: startDate, to: endDate, detail: detail, link: link)
        let newReply = Reply(replier: repo.user, comment: detail)
        var newProposal = Proposal(id: proposal.id, day: proposal.day, newEvent: proposal.newEvent, proposer: proposal.proposer, replies: proposal.replies)
        newProposal.addReply(reply: newReply)
        var newTrip = Trip(id: trip.id, name: trip.name, uniqueCode: trip.uniqueCode, owner: trip.owner, members: trip.members, memberIds: trip.memberIds, destination: trip.destination, from: trip.from, to: trip.to, itinerary: trip.itinerary, proposals: trip.proposals, tasks: trip.tasks)
        newTrip.updateProposal(proposal: newProposal)
        repo.updateTrip(trip: newTrip)
//        repo.load()
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
      CreateReplyView(repo: UserRepository(), trip: Trip.example, proposal: Proposal.example)
    }
}
