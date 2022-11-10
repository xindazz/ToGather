//
//  CreateTripProposal.swift
//  ToGather
//
//  Created by Lisa Leung on 11/9/22.
//

// MARK: based off of Susan Song's code for OnboardingThree.swift


import SwiftUI


struct CreateTripProposal: View {
  
  @ObservedObject var repo: UserRepository
  
  @State private var name = ""
  @State private var destination = ""
  @State private var startDate = Date()
  @State private var endDate = Date()
  
  var body: some View {
    
    VStack {
      
      VStack{
//        MARK: Trip header
        VStack (alignment: .leading){
          Text("NYC Trip")
            .font(.largeTitle)
          Text("September 10-14, 2022")

          Divider()
        } //end Vstack
//      signifies that this is the create trip proposal page
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
                  Text("Category")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
          //        MARK: @Xinda, replace $name for the (Event)$category field, just left it in comments to avoid compilation issues
//          filler text
                  TextField("Activity", text: $name)
                    .textContentType(.givenName).border(Color.gray.opacity(0.5))
                  
                  Text("What")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                  Text("Example: Street food from Queen's Night Market")
                    .font(.subheadline)
                    .padding()
                  //        MARK: @Xinda, replace $destination for the (Event) $detail field, just left it in comments to avoid compilation issues
// filler text
                  TextField("Enter an item on the itinerary", text: $destination)
                    .textContentType(.givenName).border(Color.gray.opacity(0.5))
                  
                  Text("Dates")
                    .frame(maxWidth: .infinity, alignment: .leading)
//                  MARK: @Xinda, replace $startData & $endDate the field names (i think it's from and to)
                  DatePicker(selection: $startDate, label: { Text("Start Date") })
                  
                  DatePicker(selection: $endDate, label: { Text("End Date") })
                  
        }

      } // end VStack
      
      Button {
//        let uniqueCode = repo.getUniqueCode()
        repo.createTrip(trip: Trip(name: name, uniqueCode: "", owner: repo.user, destination: destination, from: startDate, to: endDate))
      } label: {
        Text("Create Trip")
          .font(.title)
          .padding()
          .foregroundColor(.white)
          .background(Color.blue)
          .cornerRadius(30)
      }
      
      Spacer()
      
      Button {
        print("Invite friends button clicked")
      } label: {
        Text("Invite Friends")
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

