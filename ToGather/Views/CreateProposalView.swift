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
  
  @State private var name = ""
  @State private var category = ""
  @State private var location = ""
  @State private var startDate = Date()
  @State private var endDate = Date()
  @State private var detail = ""
  @State private var link = ""
  @State private var price = 0
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    ZStack{
      Color("secondary").ignoresSafeArea()
      
      VStack (alignment: .leading){
        
        ScrollView{
          VStack (alignment: .leading) {
            Text(repo.trips[repo.currTripIdx].name)
    //          .font(.largeTitle)
              .font(.custom("NunitoSans-SemiBold", size: 36))
              .foregroundColor(Color("primary"))
              .padding(EdgeInsets(top: 50, leading: 10, bottom: 0, trailing: 0))
            HStack {
              Text(repo.trips[repo.currTripIdx].from ?? Date(), style: .date)
                .font(.custom("NunitoSans-Regular", size: 18))
              Text("-")
                .font(.custom("NunitoSans-Regular", size: 18))

              Text(repo.trips[repo.currTripIdx].to ?? Date(), style: .date)
                .font(.custom("NunitoSans-Regular", size: 18))

            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            
            Text("Unique code: \(repo.trips[repo.currTripIdx].uniqueCode)")
              .font(.custom("NunitoSans-Regular", size: 18))
              .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            
            
          } // end inner vstack
          .background(
            Image("banner1")
  //                    .resizable()
                      .scaledToFit()
          )
          .frame(width: 400, height: 30)
  //        .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

          // signifies that this is the create trip proposal page
          VStack {
            Text("Add Trip Proposal")
              .font(.custom("NunitoSans-SemiBold", size: 30))
              .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))

            Text("Add an item on your trip's itinerary! Input what you can for now–you can build on it later with your group.")
              .font(.custom("NunitoSans-Regular", size: 18))
              .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
          } // end Vstack
          .padding(EdgeInsets(top: 50, leading: 10, bottom: 20, trailing: 0))

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
          repo.trips[repo.currTripIdx].addProposal(proposal: newProposal)
          repo.updateTrip(trip: repo.trips[repo.currTripIdx])
  //        repo.load()
          repo.tabSelection = 2
          self.presentationMode.wrappedValue.dismiss()
        } label: {
          Text("Create Proposal")
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(30)
        }
        
      } // end VStack
    } //end ZStack
    
    
    Spacer()
    
  } // end body
  
}

struct CreateProposalView_Previews: PreviewProvider {
  static var previews: some View {
    CreateProposalView(repo: UserRepository())
  }
}

