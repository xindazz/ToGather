//
//  CreateTripProposal.swift
//  ToGather
//
//  Created by Lisa Leung on 11/9/22.
//

// MARK: based off of Susan Song's code for OnboardingThree.swift


import SwiftUI


struct CreateProposalView: View {
  
  @ObservedObject var repo: UserRepository
  var trip: Trip
  
  @State private var name = ""
  @State private var category = ""
  @State private var location = ""
  @State private var startDate = Date()
  @State private var endDate = Date()
  @State private var detail = ""
  @State private var link = ""
  @State private var price = 0
  
  var body: some View {
    
    VStack {
      
      ScrollView{
        //        MARK: Trip header
        VStack (alignment: .leading){
          Text(trip.name)
            .font(.largeTitle)
          Text(trip.from ?? Date(), style: .date)
          
          Divider()
        } //end Vstack
        
        // signifies that this is the create trip proposal page
        VStack {
          Text("Add Trip Proposal")
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
            TextField("Food/Drink", text: $category)
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
            
      Button {
        let newProposal = Proposal(newEvent: Event(name: name, category: category, location: location, from: startDate, to: endDate, detail: detail, link: link), proposer: repo.user)
        var newTrip = Trip(id: trip.id, name: trip.name, uniqueCode: trip.uniqueCode, owner: trip.owner, members: trip.members, destination: trip.destination, from: trip.from, to: trip.to, itinerary: trip.itinerary, proposals: trip.proposals, tasks: trip.tasks)
        newTrip.addProposal(proposal: newProposal)
        repo.updateTrip(trip: newTrip)
        repo.load()
          
      } label: {
        Text("Create Proposal")
          .font(.title)
          .padding()
          .foregroundColor(.white)
          .background(Color.blue)
          .cornerRadius(30)
      }
      
    } // end VStack
    
    Spacer()
    
  } // end body
  
}

struct CreateProposalView_Previews: PreviewProvider {
  static var previews: some View {
    CreateProposalView(repo: UserRepository(), trip: Trip.example)
  }
}

