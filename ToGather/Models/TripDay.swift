//
//  TripDay.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/30/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct TripDay: Codable {
  
  @DocumentID var id: String?
  var date: Date?
  var dayNum: Int
  var events: [Event]
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case date
    case dayNum
    case events
  }
  
}
