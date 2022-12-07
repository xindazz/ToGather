//
//  Vote.swift
//  ToGather
//
//  Created by Xinda Zhou on 12/1/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

enum VoteStatus : Int, Codable {
  case Yes
  case No
  case Maybe
}

struct Vote: Codable, Identifiable {
  
  var id: UUID = UUID()
  var voter: User
  var vote: VoteStatus
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case voter
    case vote
  }
  
  static let example = Vote(voter: User.example, vote: VoteStatus.Yes)
  
}
