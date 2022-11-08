//
//  TripDetailCard.swift
//  ToGather
//
//  Created by Lisa Leung on 11/3/22.
//


// modified from Ricardo Montemayor's repo to understand custom view components: https://github.com/ricardomongza99/Cities/blob/main/Cities/Views/CityCard.swift

import SwiftUI

struct TripDetailCard: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 32) {
        VStack(alignment: .leading) {
            Text("Fly to LAX from LGA")
                .font(.largeTitle.bold())
            Text("Travel")
                .font(.subheadline)
        } // end inner vstack
        .foregroundColor(.white)
      
      HStack {
        Button(action: {}) {
            Label("Yes", systemImage: "hand.thumbsup")
            .buttonStyle(.bordered)
            .background(.white)
        }
        Button(action: {}) {
            Label("No", systemImage: "hand.thumbsdown")
            .buttonStyle(.bordered)
            .background(.white)
        }
        Button(action: {}) {
            Label("Edit", systemImage: "pencil")
            .buttonStyle(.bordered)
            .background(.white)
        }
      }
        
    } //end outer vstack
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
    .background(.gray)
    .cornerRadius(16)
    .shadow(color: .gray, radius: 8, x: 4, y: 4)
  } //end body

}
struct TripDetailCard_Previews: PreviewProvider {
  static var previews: some View {
    TripDetailCard()
  }
}
