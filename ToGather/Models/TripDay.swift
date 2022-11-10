//
//  TripDay.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/30/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct TripDay: Codable, Identifiable {
  
//  @DocumentID var id: String?
  var id: UUID = UUID()
  var date: Date
  var dayNum: Int?
  var events: [Event] = []
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case date
    case dayNum
    case events
  }
  
  mutating func addEvent(event: Event) {
    events.append(event)
  }
  
  mutating func setDayNum(num: Int) {
    dayNum = num
  }
  
}
