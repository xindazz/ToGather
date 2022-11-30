//
//  UserRepository.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/27/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
  
  @DocumentID var docId: String?
  var id: UUID? = UUID()
  var name: String
    var email: String
    var trips: [String] = []
    
    
    
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case docId
    case id
    case name
    case email
    case trips
  }
  
  mutating func addTrip(tripId: String) {
    trips.append(tripId)
  }
  
    static let example = User(name: "User1", email: "123@gmail.com")

}
