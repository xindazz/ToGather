//
//  UserRepository.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/27/22.
//
import SwiftUI
import Combine
import CoreData
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserRepository: ObservableObject {

  private let db = Firestore.firestore()
  private var userId: String = "pESlIAYYx09zWkaNcySl" // Demo only, user Xinda
//  private var userId: String = "ZvTpwqUDv7GD4uVXdxB4" // Demo only, user Tester2


  @Published var user: User = User(name: "")
  @Published var trips: [Trip] = []
  private var errorMessage: String = ""
  private var cancellables: Set<AnyCancellable> = []
  private var randInt: Int = 0

  @MainActor
  init() {
    userId = setUser(name: "Tester2", handle: "@12345")
    load()
  }
  
  @MainActor
  func load() {
    async {
      let user = await fetchUser(userId: userId)
      if user != nil {
        self.user = user!
      } else {
        print("Cannot get user with id \(userId)")
      }
      self.trips = []
      for tripDocId in self.user.trips {
        async {
          let trip = await fetchTrip(tripDocId: tripDocId)
          if trip != nil {
            self.trips.append(trip!)
          } else {
            print("Cannot get trip with id \(tripDocId)")
          }
        }
      }
    }
  }
  
  func fetchUser(userId: String) async -> User? {
    let document = try? await db.collection("User").document(userId).getDocument()
    return try? document?.data(as: User.self)
  }
  
  func setUser(name: String, handle: String?) -> String {
    // Add a new document with a generated id.
    let newUser = User(name: name, handle: handle ?? "")
    do {
      let ref = try db.collection("User").addDocument(from: newUser)
      print("Successfully added new user \(newUser.name)")
      return ref.documentID
    }
    catch {
      print("Error adding new user: \(error)")
      return ""
    }
  }
  
  func updateUser(user: User) {
    if let id = user.docId {
      let ref = db.collection("User").document(id)
      do {
        try ref.setData(from: user)
      }
      catch {
        print(error)
      }
    }
  }

  func fetchTrip(tripDocId: String) async -> Trip? {
    let document = try? await db.collection("Trip").document(tripDocId).getDocument()
    return try? document?.data(as: Trip.self)
  }
  
  func fetchAllTrips() async throws -> [Trip] {
    let snapshot = try await db.collection("Trip").getDocuments()
    return snapshot.documents.compactMap { document in try? document.data(as: Trip.self) }
  }
  
  func fetchAllUniqueCodes() async throws -> [String] {
    let snapshot = try await db.collection("Trip").getDocuments()
    return snapshot.documents.compactMap { document in try? document.data(as: Trip.self).uniqueCode }
  }
  
  
  @MainActor
  func createTrip(trip: Trip) {
    async {
      if let allUniqueCodes = try? await self.fetchAllUniqueCodes() {
        self.randInt = Int.random(in: 1..<1000000)
        while allUniqueCodes.contains(String(self.randInt)) {
          self.randInt = Int.random(in: 0..<1000000)
        }
      }
      let code = String(format: "%06d", self.randInt)
      let newTrip = Trip(name: trip.name,
                         uniqueCode: code,
                         owner: trip.owner,
                         members: trip.members,
                         destination: trip.destination,
                         from: trip.from,
                         to: trip.to,
                         itinerary: trip.itinerary,
                         proposals: trip.proposals,
                         tasks: trip.tasks)
      let collectionRef = db.collection("Trip")
      do {
        let ref = try collectionRef.addDocument(from: newTrip)
        print("Successfully added new trip \(trip.name)")
        self.user.trips.append(ref.documentID)
        self.updateUser(user: self.user)
      }
      catch {
        print("Error adding new trip \(error)")
      }
      self.load()
    }
  }
  
  func updateTrip(trip: Trip) {
    if let id = trip.id {
      let ref = db.collection("Trip").document(id)
      do {
        try ref.setData(from: trip)
      }
      catch {
        print(error)
      }
    }
  }
  
  @MainActor
  func joinTrip(code: String) {
    async {
      if let trips = try? await fetchAllTrips() {
        let filtered = trips.filter { trip in trip.uniqueCode == code }
        if filtered.count == 1 {
          var trip = filtered[0]
          if (trip.owner.id == self.user.id || (trip.members.filter {member in member.id == self.user.id}).count > 0) {
            print("Error: trip \(trip.id ?? "") already has user \(self.user.name) as owner or member")
            return
          }
          print("Adding member")
          trip.addMember(user: self.user)
          self.user.addTrip(tripId: trip.id ?? "")
          self.updateTrip(trip: trip)
          self.updateUser(user: self.user)
        } else {
          print("Error: \(filtered.count) trips with unique code \(code)")
        }
      }
      self.load()
    }
//    self.load()
  }
  
  //  func getTrips(tripRefs: [DocumentReference]) {
  //    for tripRef in tripRefs {
  //      tripRef.getDocument { document, error in
  //        if let error = error as NSError? {
  //          self.errorMessage = "Error getting document: \(error.localizedDescription)"
  //        }
  //        else {
  //          if let document = document {
  //            do {
  //              let trip = try document.data(as: Trip.self)
  //              self.trips.append(trip)
  //              print("Got trip \(trip.name)")
  //            }
  //            catch {
  //              print("Error decoding trip data: \(error)")
  //            }
  //          }
  //        }
  //      }
  //    }
  //  }
}

