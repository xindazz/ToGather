//
//  TestTripDetailsModel.swift
//  ToGather
//
//  Created by Lisa Leung on 11/4/22.
//

import SwiftUI
// MARK: FOR TESTING PURPOSES ONLY - based off of PriceCheck_Solution

struct TestTrips2: Identifiable, Codable {
  
  // going to use the Firebase ID later, this is just temporary
  var id = UUID()  // to conform to Identifiable protocol
//  MARK: fields derived from the current master branch's model code as of Nov 1, 2022
  var name: String
  
  var destination: String?
  var from: Date?
  var to: Date?
  var itinerary: [TestTripActivity]?

  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case name
    
    case destination
    case from
    case to
    case itinerary
  }
  
  // MARK: Example for SwiftUI
  static let example1 = TestTrips2(
    id: UUID(),
    name: "Empire State of Mind: NYC!",
    destination: "New York City",
    from: Date.now,
    to: Date.now.addingTimeInterval(259200),
    itinerary: [TestTripActivity.example0,TestTripActivity.example1,TestTripActivity.example2]
    )
  
}
