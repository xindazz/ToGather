//
//  TestAccordionList.swift
//  ToGather
//
//  Created by Lisa Leung on 11/15/22.
//

//MARK: from Hacking with Swift (Paul Hudson) article on expanding lists: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-expanding-lists
// MARK: also adapted using Paul Hudson's article on selecting items from  lists: https://www.hackingwithswift.com/quick-start/swiftui/how-to-allow-row-selection-in-a-list

import SwiftUI
struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?

    // some example websites
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    // some example groups
    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}

struct BookmarkContentView: View {
    let items: [Bookmark] = [.example1, .example2, .example3]

    var body: some View {
        List(items, children: \.items) { row in
            Image(systemName: row.icon)
            Text(row.name)
        }
    }
}
struct BookmarkContentView_Previews: PreviewProvider {
  static var previews: some View {
    BookmarkContentView()
  }
}
