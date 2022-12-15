//
//  YourTripsView.swift
//  ToGather
//
//  Created by Lisa Leung on 11/9/22.
//

import SwiftUI

struct YourTripsView: View {
//  using code from SwiftRepos - 443 lab - to start
  @ObservedObject var repo: UserRepository
  
  let tripArray = [
                    "bg10", "bg20", "bg30", "bg4"
                  ]
//  code by and provided by Helena Spencer, 67-443 TA
  func sendMessage(){
//    replace something with a typical string interpolation\(trip.unique code) and whatnot
    let sms: String = "sms:&body=Let's plan a trip together on ToGather!"
    let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
   }
  
  var body: some View {
//    var tripBg = tripArray[0]
    VStack (alignment: .leading) {

      NavigationView {
        VStack (alignment: .leading, spacing:10) {
          Text("Welcome, \(repo.user.name)!")
            .font(.custom("NunitoSans-Light", size: 18))

//            .font(.headline)
//            .font(.title)

//            NavigationLink(destination: OnboardingOne()) {
//              Text("Create an Account [demo]")
//                .font(.title)
//                .foregroundColor(.blue)
//          } //end navlink
                          
          Text("Your Trips")
            .font(.custom("NunitoSans-SemiBold", size: 24))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
          ScrollView {
            VStack{
//              ForEach(repo.trips) { trip in
              ForEach(Array(repo.trips.enumerated()), id: \.offset) { index, trip in
                NavigationLink(destination: TripView(repo: repo, trip: repo.trips[index])) {
                  
//                  tripBg = tripArray[index % 4]
                  
                  Button {} label: {
                    VStack (spacing: 10){
                      Text(trip.name)
//                        .font(.headline)
                        .font(.custom("NunitoSans-Bold", size: 22))
                        .foregroundColor(.white)
                      Text(trip.from ?? Date(), style: .date)
//                        .font(.subheadline)
                        .font(.custom("NunitoSans-Regular", size: 18))
                        .foregroundColor(.white)
                    }
                  } // end button

                  .background(
//                      Image("bg4")
                    Image(tripArray[index % 4])
//                      .resizable()
                      .aspectRatio(contentMode: .fill)
//                    .resizable()
//                    .scaledToFit()
                  )
                  .frame(width: 300, height:150)
                  .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                  .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))

//                  .padding(5)
//                  .padding(10)
//                  background(
//                    Image(tripBg ?? "")
//                      .frame(width: 300)
//                      .clipShape(RoundedRectangle(cornerRadius: 12))
//                      .shadow(
//                        color: Color.gray.opacity(0.7),
//                        radius: 8,
//                        x: 0,
//                        y: 0
//                      )
//                  )
                  
                } //end navlink
                .simultaneousGesture(TapGesture().onEnded{
                  print("Clicked trip index \(index)")
                  repo.currTripIdx = index
                  repo.tabSelection = 1
                })
              } // end ForEach
            } //end vstack
          } //end ScrollView
          
          VStack {
//            MARK: default text message to tell people to join the app
//            Button(action: {sendMessage()}) {
//               Spacer()
//              Label("Invite Friends", systemImage: "message.fill")
//                   .font(.custom("NunitoSans-Bold", size: 18))
//                   .foregroundColor(.white)
//               Spacer()
//            }
//            .frame(width: 310, height:50)
//            .background(Color("secondary"))
//            .clipShape(RoundedRectangle(cornerRadius: 12))
//            .padding(3)
            NavigationLink(destination: CreateTripView(repo: repo)) {
              Button(action: {}) {
                Label("Create Trip", systemImage: "plus.circle")
                     .font(.custom("NunitoSans-Bold", size: 18))
                     .foregroundColor(.white)
              }
               .frame(width: 310, height:50)
               .background(Color("primary"))
               .clipShape(RoundedRectangle(cornerRadius: 12))
               .padding(3)
            } //end navlink
            NavigationLink(destination: JoinTripView(repo: repo)) {
              Button(action: {}) {
                Label("Join Trip", systemImage: "person.badge.plus")
                     .font(.custom("NunitoSans-Bold", size: 18))
                     .foregroundColor(.white)
              }
               .frame(width: 310, height:50)
               .background(Color("tertiary"))
               .clipShape(RoundedRectangle(cornerRadius: 12))
               .padding(3)
            } //end navlink
          } // hstack
//          MARK: button in case the cheat link doesn't work
//          HStack {
//            NavigationLink(destination: OnboardingOne(repo:UserRepository())) {
//              Button(action: {}) {
//                Text("Create an Account [demo]").font(.headline)
//                  .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                  .foregroundColor(.white)
//              } // end button
//              .frame(width: 300, height: 60)
//              .background(Color(UIColor.systemGreen))
//              .clipShape(RoundedRectangle(cornerRadius: 12))
//              .padding(10)
//            } //end navlink
//          } // end hstack
        }
        
      } //end NavView
      
//      HStack {
//        Button {
//          repo.load()
//        } label: {
//          Text("Refresh")
//        }.frame(maxWidth: .infinity, alignment: .center)
//        
//        Button {
//          repo.signOut()
//        } label: {
//          Text("Sign Out")
//        }.frame(maxWidth: .infinity, alignment: .center)
//      } // end hstack
      
    } //end vstack
    
  } //end body
  
 
} //end struct

struct YourTripsView_Previews: PreviewProvider {
  static var previews: some View {
    YourTripsView(repo: UserRepository())
  }
}
