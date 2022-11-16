//
//  TestTripAccordion.swift
//  ToGather
//
//  Created by Lisa Leung on 11/15/22.
//

//MARK: from Hacking with Swift (Paul Hudson) article on expanding lists: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-expanding-lists
// MARK: also adapted using Paul Hudson's article on selecting items from  lists: https://www.hackingwithswift.com/quick-start/swiftui/how-to-allow-row-selection-in-a-list

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
    static let example2 = TestAccordion(name: "Recent", icon: "timer", items: [TestAccordion.apple, TestAccordion.bbc, TestAccordion.swift, TestAccordion.twitter])
    static let example3 = TestAccordion(name: "Recommended", icon: "hand.thumbsup", items: [TestAccordion.apple, TestAccordion.bbc, TestAccordion.swift, TestAccordion.twitter])
}

struct TestAccordionContentView: View {

    let items: [TestAccordion] = [.example1]

    var body: some View {

        NavigationView {
            List(items, children: \.items) { row in
                 Image(systemName: row.icon)
                 Text(row.name)
             } // end list
        } // end navigation
    }
}
struct TestAccordionContentView_Previews: PreviewProvider {
  static var previews: some View {
    TestAccordionContentView()
  }
}
