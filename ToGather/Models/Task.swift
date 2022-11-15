//
//  Task.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/30/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    //    let id = UUID()
    //    let name: String
    //    var isCompleted: Bool
    
    var id: UUID = UUID()
    var name: String
    var isCompleted: Bool
    
    
    //user trip task ** rep rep user task repo trip repo task
}
  
  // To conform to Codable protocol
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case isCompleted
    
  }
  


//
//
//
//struct Task: Codable, Identifiable {
//
//  @DocumentID var id: String?
//  var name: String?
//  var details: String?
//  var members: [User]?
//  var dueDate: Date?
//  var done: Bool
//  var day: TripDay?
//
//    //user trip task ** rep rep user task repo trip repo task
//
//
//  // To conform to Codable protocol
//  enum CodingKeys: String, CodingKey {
//    case id
//    case name
//    case details
//    case members
//    case dueDate
//    case done
//    case day
//  }
//
//}
//
//





