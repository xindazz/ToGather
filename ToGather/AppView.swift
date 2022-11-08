// Created by Prof. H in 2022
// Part of the PriceCheckFB project
// Using Swift 5.0
// Qapla'

import SwiftUI

struct AppView: View {
  @ObservedObject var userRepo = UserRepository()
  
  var body: some View {
    VStack {
      Text(userRepo.user.name)
      Text(userRepo.user.handle ?? "")
      Text(userRepo.user.phone ?? "")
      List {
        ForEach(userRepo.trips) { trip in
          Text(trip.name)
        }
      }
    }
  }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingOne()
    }
}

