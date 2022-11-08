//
//  Task.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/30/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
  
  @DocumentID var id: String?
  var name: String?
  var details: String?
  var members: [User]?
  var dueDate: Date?
  var done: Bool
  var day: TripDay?
  
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case details
    case members
    case dueDate
    case done
    case day
  }
  
}
