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

struct Event: Codable, Identifiable {
  
  var id: UUID = UUID()
  var name: String
  var category: String
  var location: String?
  var from: Date?
  var to: Date?
  var detail: String?
  var link: String?
  var price: Float?
  var photo: String?
  
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case category
    case location
    case from
    case to
    case detail
    case link
    case price
    case photo
  }
  
  static let example = Event(name: "Event1", category: "Food", location: "123 Main St.", from: Date(), to:Date())
  
}
