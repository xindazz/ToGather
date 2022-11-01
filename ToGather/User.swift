//
//  UserRepository.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/27/22.
//

import Foundation

import SwiftUI
import FirebaseFirestoreSwift

struct User: Codable {
  
//  var id: String
  @DocumentID var id: String?
  var name: String
  var handle: String
  var phone: String
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case handle
    case phone
  }
  
  // MARK: Example for SwiftUI
  static let example = User(name: "Bob", handle: "", phone: "")
  
}
