//
//  DateFormat.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/10/22.
//

import Foundation

class CustomDateFormatter {
  
  func toDate(_ date: Date?) -> String {
    if date == nil {
      return "Unknown Time"
    }
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    return formatter.string(from: date!)
  }
  
  func toDateTime(_ date: Date?) -> String {
    if date == nil {
      return "Unknown Time"
    }
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, HH:mm"
    return formatter.string(from: date!)
  }
  
  func toDateTimeDay(_ date: Date?) -> String {
    if date == nil {
      return "Unknown Time"
    }
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d, HH:mm"
    return formatter.string(from: date!)
  }
}
