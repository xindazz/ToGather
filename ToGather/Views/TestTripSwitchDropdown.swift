//
//  TestTripSwitchDropdown.swift
//  ToGather
//
//  Created by Lisa Leung on 11/15/22.
//

import SwiftUI

struct TestTripSwitchDropdown: View {
//  using code from SwiftRepos - 443 lab - to start
  @ObservedObject var repo: UserRepository
//  var repo: UserRepository
  @ObservedObject var trip: TripRepository
  var dateFormatter = DateFormatter()
  
  var body: some View {
    VStack (alignment: .leading) {
      // header vstack
      VStack (alignment: .leading, spacing:10) {
        Text("Welcome, \(repo.user.name)!")
          .font(.headline)
        NavigationLink(destination: OnboardingOne()) {
          Text("Create an Account [demo]")
            .font(.title)
            .foregroundColor(.blue)
        } //end navlink
      } //end header vstack
      ScrollView {
        
      } //end scrollview
      
    } //end outermost vstack
    
  } //end body
  
 
} //end struct

struct TestTripSwitchDropdown_Previews: PreviewProvider {
  
  static var previews: some View {
    TestTripSwitchDropdown(repo: UserRepository(), trip: TripRepository())
  }
}
