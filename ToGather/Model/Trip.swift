//
//  Trip.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/27/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Trip: Codable, Identifiable {
  
//  var id: String
  @DocumentID var id: String?
  var name: String
  var unique_code: String?
  var owner: DocumentReference
  var members: [User]?
  var destination: String?
  var from: Date?
  var to: Date?
  var itinerary: [TripDay]?
  var proposals: [Proposal]?
  var tasks: [Task]?
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case unique_code
    case owner
    case members
    case destination
    case from
    case to
    case itinerary
    case proposals
    case tasks
  }
  
}

