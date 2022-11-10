//
//  Vote.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/30/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift


struct Reply: Codable, Identifiable {
  
  var id: UUID = UUID()
  var replier: User
  var event: Event?
  var comment: String
  
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case replier
    case event
    case comment
  }
  
  static let example = Reply(replier: User.example, comment: "Comment1")
  
}
