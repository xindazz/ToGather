//
//  UpdateProposalView.swift
//  ToGather
//
//  Created by Xinda Zhou on 12/8/22.
//

import SwiftUI

struct UpdateProposalView: View {
  @ObservedObject var repo: UserRepository
  var proposal: Proposal
  
  @State private var name = ""
  @State private var category = ""
  @State private var location = ""
  @State private var startDate = Date()
  @State private var endDate = Date()
  @State private var detail = ""
  @State private var link = ""
  @State private var price: Float = 0
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  func populateData() {
    name = proposal.newEvent.name
    category = proposal.newEvent.category
    location = proposal.newEvent.location ?? ""
    startDate = proposal.newEvent.from ?? Date()
    endDate = proposal.newEvent.to ?? Date()
    detail = proposal.newEvent.detail ?? ""
    link = proposal.newEvent.link ?? ""
    price = proposal.newEvent.price ?? 0
  }
  
  var body: some View {
    
    VStack {
      
      ScrollView{
        //        MARK: Trip header
        VStack (alignment: .leading){
          Text(repo.trips[repo.currTripIdx].name)
            .font(.largeTitle)
          Text(repo.trips[repo.currTripIdx].from ?? Date(), style: .date)
          
          Divider()
        } //end Vstack
        
        // signifies that this is the create trip proposal page
        VStack {
          Text("Update Proposal")
            .font(.title)
            .padding()
          
          Text("Add an item on your trip's itinerary! Input what you can for now–you can build on it later with your group.")
            .font(.subheadline)
            .padding()
        } // end Vstack
        
        // MARK: form stack (sorry for the obnoxious number of stacks, this is to avoid the stack capacity issue
        VStack{
          //        MARK: text input for now, should *DEFINITELY* be a dropdown later for data integrity
          VStack {
            Text("Category")
              .font(.title)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
            TextField(proposal.newEvent.category, text: $category)
              .textContentType(.givenName).border(Color.gray.opacity(0.5))
          }
          
          VStack {
            Text("What")
              .font(.title)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
            Text("Example: Street food from Queen's Night Market")
              .font(.subheadline)
            TextField("Event name", text: $name)
              .textContentType(.givenName).border(Color.gray.opacity(0.5))
          }
          
          VStack {
            Text("Location")
              .font(.title)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
            TextField("123 Main St.", text: $location)
              .textContentType(.givenName).border(Color.gray.opacity(0.5))
          }
          
          VStack {
            Text("Dates")
              .frame(maxWidth: .infinity, alignment: .leading)
            //                  MARK: @Xinda, replace $startData & $endDate the field names (i think it's from and to)
            DatePicker(selection: $startDate, label: { Text("Start Date") })
            DatePicker(selection: $endDate, label: { Text("End Date") })
          }
          
          VStack {
            Text("Comment")
              .font(.title)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Details", text: $detail)
              .textContentType(.givenName).border(Color.gray.opacity(0.5))
          }
          
          VStack {
            Text("Link")
              .font(.title)
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
            TextField("http://", text: $link)
              .textContentType(.givenName).border(Color.gray.opacity(0.5))
          }
          
        }
        
      } // end VStack
      .onAppear {
        populateData()
      }
            
      Button {
        let newProposal = Proposal(id: proposal.id, day: proposal.day, newEvent: Event(name: name, category: category, location: location, from: startDate, to: endDate, detail: detail, link: link), proposer: repo.user)
        repo.trips[repo.currTripIdx].updateProposal(proposal: newProposal)
        repo.updateTrip(trip: repo.trips[repo.currTripIdx])
//        repo.load()
        repo.tabSelection = 2
        self.presentationMode.wrappedValue.dismiss()
      } label: {
        Text("Update Proposal")
          .font(.title)
          .padding()
          .foregroundColor(.white)
          .background(Color.blue)
          .cornerRadius(30)
      }
      
    } // end VStack
    
    Spacer()
    }
}

struct UpdateProposalView_Previews: PreviewProvider {
    static var previews: some View {
      UpdateProposalView(repo: UserRepository(), proposal: Proposal.example)
    }
}
