//
//  TestTripAccordion.swift
//  ToGather
//
//  Created by Lisa Leung on 11/15/22.
//

//MARK: from Hacking with Swift (Paul Hudson) article on expanding lists: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-expanding-lists
// MARK: also adapted using Paul Hudson's article on selecting items from  lists: https://www.hackingwithswift.com/quick-start/swiftui/how-to-allow-row-selection-in-a-list

//MARK: use binding variables to change the name of the dropdown to match the name of the trip

import SwiftUI

struct TestAccordion: Identifiable {

    let id = UUID()
    let name: String
    let icon: String
    var items: [TestAccordion]?

    // some example websites
    static let apple = TestAccordion(name: "Apple", icon: "1.circle")
    static let bbc = TestAccordion(name: "BBC", icon: "square.and.pencil")
    static let swift = TestAccordion(name: "Swift", icon: "bolt.fill")
    static let twitter = TestAccordion(name: "Twitter", icon: "mic")
    
    // some example groups
    static let example1 = TestAccordion(name: "Favorites", icon: "star", items: [TestAccordion.apple, TestAccordion.bbc, TestAccordion.swift, TestAccordion.twitter])
////  EXAMPLES
//  static let example10 = Trip(
//                              name: "wonderful test trip No. 1",
//                              uniqueCode: "000111",
//                              owner: User.example,
//                              destination: "New York City"
//                        )
//  static let example20 = Trip(
//                              name: "wonderful test trip No. 2",
//                              uniqueCode: "000666",
//                              owner: User.example,
//                              destination: "Santa Clara, California"
//                        )

//  static let availableTrips = [Trip.example10, Trip.example20]
}

struct TestAccordionContentView: View {
    @ObservedObject var repo: UserRepository
//    let items: [Trip] = [.example1, .example2]

    var body: some View {
        let items: [Bookmark] = [.example1]

        NavigationView {
            List(items, children: \.items) { row in
                 Image(systemName: row.icon)
                 Text(row.name)
             } // end list
          
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
          
//          List {
//            ForEach(DATA, id: \.self { data in
//              NavigationLink(destination: DetailView(data: data)) {
//                HStack {
//                  Text(data.name)
//                  Button(action: {
//                     // add to an array
//                  }) {
//                       Text(data.price)
//                  }.buttonStyle(PlainButtonStyle())
//                }
//              }
//            }
//          }
        } // end navigation
    }
}
struct TestAccordionContentView_Previews: PreviewProvider {
  static var previews: some View {
    TestAccordionContentView(repo: UserRepository())
  }
}
