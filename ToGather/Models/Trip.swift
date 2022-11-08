//
//  Trip.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/27/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Trip: Codable, Identifiable {
  
//  var id: String
  @DocumentID var id: String?
  var name: String
  var uniqueCode: String
  var owner: User
  var members: [User] = []
  var destination: String?
  var from: Date?
  var to: Date?
  var itinerary: [TripDay] = []
  var proposals: [Proposal] = []
  var tasks: [Task] = []
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case uniqueCode
    case owner
    case members
    case destination
    case from
    case to
    case itinerary
    case proposals
    case tasks
  }
  
  mutating func setUniqueCode(code: String) {
    uniqueCode = code
  }
  
  mutating func addMember(user: User) {
    members.append(user)
  }
  
  mutating func addItinerary(tripDay: TripDay) {
    itinerary.append(tripDay)
  }
  
  mutating func addProposal(proposal: Proposal) {
    proposals.append(proposal)
  }
  
  mutating func addTask(task: Task) {
    tasks.append(task)
  }
}

