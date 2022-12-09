// Created by Prof. H in 2022
// Part of the PriceCheckFB project
// Using Swift 5.0
// Qapla'

import SwiftUI

struct AppView: View {
  @ObservedObject var repo = UserRepository()
  @State private var name: String = "Bob"
  @State private var destination: String = "LA"
  
  @ViewBuilder
  var body: some View {

//    MARK: Changed this a default log-in page with shortcuts :)
    ZStack {

      VStack {
        switch repo.signedIn {
        case true:
          YourTripsView(repo: repo)
            .transition(.scale)
        case false:
          PreSignInView(repo: repo)
        }
        
      } //  end Vstack
   } //end ZStack
      
  }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
