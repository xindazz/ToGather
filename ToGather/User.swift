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

struct User: Codable {
  
  @DocumentID var id: String?
  var name: String
  var handle: String?
  var phone: String?
  var trips: [DocumentReference] = []
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case handle
    case phone
    case trips
  }
  
}
