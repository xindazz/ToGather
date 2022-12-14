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
                      .scaledToFit()
          )
          .frame(width: 400, height: 30)
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

          // signifies that this is the create trip proposal page
          VStack {
            Text("Add Trip Proposal")
              .font(.custom("NunitoSans-Bold", size: 30))
              .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
              .foregroundColor(.white)


            Text("Propose an item for your trip's itinerary! Input what you can for now???you can decide on all the details later.")
              .multilineTextAlignment(.center)
              .font(.custom("NunitoSans-Regular", size: 18))
              .padding(EdgeInsets(top: 1, leading: 10, bottom: 0, trailing: 10))
              .foregroundColor(.white)

          } // end Vstack
          .padding(EdgeInsets(top: 50, leading: 10, bottom: 20, trailing: 0))

          // MARK: form stack (sorry for the obnoxious number of stacks, this is to avoid the stack capacity issue
          VStack{
            //        MARK: text input for now, should *DEFINITELY* be a dropdown later for data integrity
            VStack {
              Text("Category")
                .font(.custom("NunitoSans-SemiBold", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)

              TextField(" Food/Drink", text: $category)
                .textContentType(.givenName).border(Color.gray.opacity(0.5))
                .background(Color.white)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))

            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

            
            VStack {
              Text("What")
                .font(.custom("NunitoSans-SemiBold", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)

              TextField(" Street food from Queen's Night Market", text: $name)
                .textContentType(.givenName).border(Color.gray.opacity(0.5))
                .background(Color.white)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

            
            VStack {
              Text("Location")
                .font(.custom("NunitoSans-SemiBold", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)

              TextField(" 123 Main St.", text: $location)
                .textContentType(.givenName).border(Color.gray.opacity(0.5))
                .background(Color.white)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))


            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

            
            VStack {
              Text("Dates")
                .font(.custom("NunitoSans-SemiBold", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)

              //                  MARK: @Xinda, replace $startData & $endDate the field names (i think it's from and to)
              DatePicker(selection: $startDate, label: { Text("Start Date") })
                .foregroundColor(.white)

              DatePicker(selection: $endDate, label: { Text("End Date") })
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))


            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

            
            VStack {
              Text("Comment")
                .font(.custom("NunitoSans-SemiBold", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)

              TextField(" Details", text: $detail)
                .textContentType(.givenName).border(Color.gray.opacity(0.5))
                .background(Color.white)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))

            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

            
            VStack {
              Text("Link")
                .font(.custom("NunitoSans-SemiBold", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)


              TextField(" http://", text: $link)
                .textContentType(.givenName).border(Color.gray.opacity(0.5))
                .background(Color.white)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))

            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
          }
          
        } // end VStack

        Button(action: {
          let newProposal = Proposal(newEvent: Event(name: name, category: category, location: location, from: startDate, to: endDate, detail: detail, link: link), proposer: repo.user)
          repo.trips[repo.currTripIdx].addProposal(proposal: newProposal)
          repo.updateTrip(trip: repo.trips[repo.currTripIdx])
          repo.tabSelection = 2
          self.presentationMode.wrappedValue.dismiss()
        }) {
          Label("Create a Proposal", systemImage: "plus.circle")
            .font(.custom("NunitoSans-Bold", size: 18))
            .padding()
            .foregroundColor(.white)
        } // end button
        .frame(width: 300, height:50)
        .background(Color("primary"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
        
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

