//
//  Proposal.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/30/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Proposal: Codable, Identifiable {
  
  var id: UUID? = UUID()
  var day: TripDay?
  var newEvent: Event
  var proposer: User
  var replies: [Reply] = []
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case day
    case newEvent
    case proposer
    case replies
  }
  
  mutating func addReply(reply: Reply) {
    replies.append(reply)
  }
  
  static let example = Proposal(newEvent: Event.example, proposer: User.example)
}
