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
  private var userId: String = "SIHsxbJlAHG4yJLoIeZS" // Demo only

  @Published var user: User = User(name: "")
  @Published var trips: [Trip] = []
  @Published var curr_trip_idx: Int = 0
  private var errorMessage: String = ""
  private var cancellables: Set<AnyCancellable> = []

  @MainActor
  init() {
//    userId = setUser(name: "Bob", handle: "@12345")
//    getUser(userId: userId)
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
      for tripRef in self.user.trips {
        async {
          let trip = await fetchTrip(ref: tripRef)
          if trip != nil {
            self.trips.append(trip!)
          } else {
            print("Cannot get trip with ref id \(tripRef.documentID)")
          }
        }
      }
    }
    if self.trips.count > 0 && self.curr_trip_idx < self.trips.count {
      print("Curr trip has \(self.trips[self.curr_trip_idx].members.count) members")
    }
  }
  
  func fetchUser(userId: String) async -> User? {
    // Complete this function
    let document = try? await db.collection("User").document(userId).getDocument()
    
    return try? document?.data(as: User.self)
  }
  
  func setUser(name: String, handle: String?) -> String {
    // Add a new document with a generated id.
    var ref: DocumentReference? = nil
    ref = db.collection("User").addDocument(data: [
        "name": name,
        "handle": handle ?? ""
    ]) { err in
        if let err = err {
            print("Error adding user: \(err)")
        } else {
            print("User added with ID: \(ref!.documentID)")
        }
    }
    return ref!.documentID
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

  func fetchTrip(ref: DocumentReference) async -> Trip? {
    let document = try? await ref.getDocument()
    return try? document?.data(as: Trip.self)
  }
  
  func createTrip(trip: Trip) {
    let collectionRef = db.collection("Trip")
      do {
        let ref = try collectionRef.addDocument(from: trip)
        print("Successfully added new trip \(trip.name)")
        self.user.trips.append(ref)
        self.updateUser(user: self.user)
      }
      catch {
        print("Error adding new trip \(error)")
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

