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
  
  @DocumentID var id: String?
  var replier: User
  var newEvent: Event
  var comment: String?
  
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case replier
    case newEvent
    case comment
  }
  
}
