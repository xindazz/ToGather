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
//  code by and provided by Helena Spencer, 67-443 TA
  func sendMessage(){
//    replace something with a typical string interpolation\(trip.unique code) and whatnot
    let sms: String = "sms:&body=Join this event with me! \n Event: something \n Date: something"
    let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
   }
  var body: some View {
    VStack (alignment: .leading) {

      NavigationView {
        VStack (alignment: .leading, spacing:10) {
          Text("Welcome, \(repo.user.name)!")
            .font(.headline)
          NavigationLink(destination: OnboardingOne()) {
              Text("Create an Account [demo]")
                .font(.title)
                .foregroundColor(.blue)
          } //end navlink
//          MARK: TESTING SEND MESSAGE

          
          Text("Your Trips")
            .font(.title)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
          ScrollView {
            VStack{
              ForEach(repo.trips) { trip in
                NavigationLink(destination: TripView(trip: trip, repo: repo)) {
                  Button(action: {}) {
                    VStack (spacing: 10){
                      Text(trip.name)
                        .font(.headline)
                        .foregroundColor(.white)
                      Text(trip.from ?? Date(), style: .date)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    }//end vstack
                  } // end button
                  .frame(width: 300, height:150)
                  .background(Color(UIColor.systemBlue))
                  .clipShape(RoundedRectangle(cornerRadius: 12))
                  .padding(10)
                  
                } //end navlink
              } // end ForEach
            } //end vstack
          } //end ScrollView
          
          VStack {
            Button(action: {sendMessage()}) {
               Spacer()
              Label("Invite Friends", systemImage: "message.fill")
                   .font(.headline)
                   .padding()
                   .foregroundColor(.white)
               Spacer()
            }
            .frame(width: 310, height:50)
            .background(Color(UIColor.systemMint))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(5)
            
            NavigationLink(destination: OnboardingThree(repo: repo)) {
              Button(action: {}) {
                  Text("Create Trip")
                     .font(.headline)
                     .foregroundColor(.white)
              }
               .frame(width: 310, height:50)
               .background(Color(UIColor.systemMint))
               .clipShape(RoundedRectangle(cornerRadius: 12))
               .padding(5)
            } //end navlink
            NavigationLink(destination: JoinTripView(repo: repo)) {
              Button(action: {}) {
                  Text("Join Trip")
                     .font(.headline)
                     .foregroundColor(.white)
              }
               .frame(width: 310, height:50)
               .background(Color(UIColor.systemMint))
               .clipShape(RoundedRectangle(cornerRadius: 12))
               .padding(5)
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
      
      HStack {
        Button {
          repo.load()
        } label: {
          Text("Refresh")
        }.frame(maxWidth: .infinity, alignment: .center)
      }
      
    } //end vstack
    
  } //end body
  
 
} //end struct

struct YourTripsView_Previews: PreviewProvider {
  static var previews: some View {
    YourTripsView(repo: UserRepository())
  }
}
