//
//  Event.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/30/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

//enum EventType: Int, Codable {
//  case lodging, travel, activity
//}

struct Event: Codable {
  
//  @DocumentID var id: String?
  var id: UUID
  var name: String
  var type: String?
  var location: String?
  var from: Date?
  var to: Date?
  var detail: String?
  var price: Float?
  var photo: String?
  
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case type
    case location
    case from
    case to
    case detail
    case price
    case photo
  }
  
}
