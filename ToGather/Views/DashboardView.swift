//
//  TestDashboardIntegratedView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/7/22.
//

import SwiftUI

struct DashboardView: View {

  @ObservedObject var repo: UserRepository
  
  var dateFormatter = DateFormatter()
  
  func sendMessage(){
//    replace something with a typical string interpolation\(trip.unique code) and whatnot
    let sms: String = "sms:&body=Join this event with me! \n Event: something \n Date: something"
    let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
   }
  
  var body: some View {
    
    // MARK: trip header
    ScrollView {
      VStack (alignment: .leading) {
        Spacer()
        Text(repo.trips[repo.currTripIdx].name)
//          .font(.largeTitle)
          .font(.custom("NunitoSans-SemiBold", size: 36))
          .foregroundColor(Color("primary"))
          .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
        HStack {
          Text(repo.trips[repo.currTripIdx].from ?? Date(), style: .date)
            .font(.custom("NunitoSans-Regular", size: 18))
          Text("-")
            .font(.custom("NunitoSans-Regular", size: 18))

          Text(repo.trips[repo.currTripIdx].to ?? Date(), style: .date)
            .font(.custom("NunitoSans-Regular", size: 18))

        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        
        Text("Unique code: \(repo.trips[repo.currTripIdx].uniqueCode)")
          .font(.custom("NunitoSans-Regular", size: 18))
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        
//        Button(action: {sendMessage()}) {
//          Spacer()
//          Label("Invite Friends", systemImage: "message.fill")
//               .font(.headline)
//               .padding()
//               .foregroundColor(.white)
//          Spacer()
//        }
        Button(action: {sendMessage()}) {
          Label("Invite", systemImage: "message.fill")
//               .font(.headline)
               .font(.custom("NunitoSans-Bold", size: 18))
               .padding()
               .foregroundColor(.white)
        }
        .frame(width: 120, height:50)
        .background(Color("secondary"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 5))

        Divider()
        //    MARK: members block
        VStack (alignment: .leading){
          Text("Members")
//            .font(.headline)
            .font(.custom("NunitoSans-SemiBold", size: 18))
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          HStack {
            ForEach(repo.trips[repo.currTripIdx].members) { member in
              VStack {
                Image("woman1")
                  .resizable()
                  .scaledToFit()
                  .clipShape(Circle())
                  .frame(width: 100, height: 100)
                VStack(alignment: .trailing) {
                  Text(member.name)
                    .font(.caption)
                } //end VStack
              } //end VStack
            } //end ForEach
          }//end hstack
          .padding(EdgeInsets(top: -10, leading: 20, bottom: 10, trailing: 0))
        } // end vstack
        
        //    MARK: trip details block
        VStack (alignment: .leading){
          Text("Trip Details")
            .font(.custom("NunitoSans-Light", size: 30))
//            .font(.title)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
          
          NavigationLink(destination: CreateProposalView(repo: repo)) {
            Button(action: {}) {
              Label("Create a Proposal", systemImage: "plus.circle")
//                .font(.headline)
                .font(.custom("NunitoSans-Bold", size: 18))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .foregroundColor(.white)
            } // end button
            .frame(width: 300, height:50)
            .background(Color("primary"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))

//            .padding()
          } //end navlink
          
          
          Text("Category")
//            .font(.title2)
            .font(.custom("NunitoSans-Regular", size: 24))
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          Spacer()
          Spacer()
            VStack (alignment: .leading){
              ForEach(repo.trips[repo.currTripIdx].itinerary) { day in
                VStack (alignment: .leading, spacing: 20) {
                  Text("Day \(day.dayNum!)")
                    .font(.custom("NunitoSans-Bold", size: 18))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
//                    .font(.headline)
                  
                  Text(dateFormatter.string(from: day.date)).font(.subheadline)
                  VStack {
                    ForEach(day.events) { event in
                      VStack (alignment: .leading){
                        EventCard(event: event)
                      } // end VStack
                    } // end ForEach
                  } // end Vstack
                  .padding(.leading, 20)
                } // end VStack
              } // end ForEach
              
            } // end VStack
          Spacer()
        } // end VStack
        Spacer()
      } //end vstack
    }
  } //end body
  
 
} //end struct

