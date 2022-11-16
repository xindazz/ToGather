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
    let formatter = CustomDateFormatter()
    
    var existingDates = itinerary.compactMap { tripDay in formatter.toDate(tripDay.date) }
    
    // Add new tripDay to itinerary if doesn't exist
    if (proposal.newEvent.from != nil && !existingDates.contains(formatter.toDate(proposal.newEvent.from))) {
      let newTripDay = TripDay(date: proposal.newEvent.from!)
      itinerary.append(newTripDay)
      itinerary = itinerary.sorted(by: { $0.date < $1.date })
      var newItinerary: [TripDay] = []
      for (i, tripDay) in itinerary.enumerated() {
        newItinerary.append(TripDay(id: tripDay.id, date: tripDay.date, dayNum: i+1, events: tripDay.events))
      }
      itinerary = newItinerary
    }
    
    existingDates = itinerary.compactMap { tripDay in formatter.toDate(tripDay.date) }
    let dayIndex = existingDates.firstIndex(of: formatter.toDate(proposal.newEvent.from))!
    let newProposal = Proposal(id: proposal.id, day: itinerary[dayIndex], newEvent: proposal.newEvent, proposer: proposal.proposer, replies: proposal.replies)
    proposals.append(newProposal)
  }
  
  mutating func updateProposal(proposal: Proposal) {
    let existingDates = proposals.compactMap { p in p.id! }
    let idx = existingDates.firstIndex(of: proposal.id!)
    if idx == nil {
      print("Error: proposal to update does not exist in trip")
      return
    }
    proposals[idx!] = Proposal(id: proposal.id, day: proposal.day, newEvent: proposal.newEvent, proposer: proposal.proposer, replies: proposal.replies)
  }
  
  mutating func approveProposal(proposal: Proposal) {
    let existingDates = proposals.compactMap { p in p.id! }
    let idx = existingDates.firstIndex(of: proposal.id!)
    if idx == nil {
      print("Error: proposal to approve does not exist in trip")
      return
    }
    proposals.remove(at: idx!)
    let tripDay = itinerary[proposal.day!.dayNum! - 1]
    var newTripDay = TripDay(id: tripDay.id, date: tripDay.date, dayNum: tripDay.dayNum, events: tripDay.events)
    newTripDay.addEvent(event: proposal.newEvent)
    itinerary[proposal.day!.dayNum! - 1] = newTripDay
  }
  
  mutating func addTask(task: Task) {
    tasks.append(task)
  }
  
  static let example = Trip(name: "Trip1", uniqueCode: "000000", owner: User.example)
}

//MARK: examples for test trip accordion
//case id
//case name
//case uniqueCode
//case owner
//case members
//case destination
//case from
//case to
//case itinerary
//case proposals
//case tasks
let example1 = Trip(
                            name: "wonderful test trip No. 1",
                            uniqueCode: "000111",
                            owner: User.example,
                            destination: "New York City"
                      )
let example2 = Trip(
                            name: "wonderful test trip No. 2",
                            uniqueCode: "000666",
                            owner: User.example,
                            destination: "Santa Clara, California"
                      )
