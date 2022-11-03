//
//  TestDashboardModel.swift
//  ToGather
//
//  Created by Lisa Leung on 11/3/22.
//

// MARK: FOR TESTING PURPOSES ONLY - based off of SwiftRepos Lab
import SwiftUI
//struct Dashboard: Codable {
//  let items: [TestTrips]
//
//  enum CodingKeys: String, CodingKey {
//    case items
//  }
//}
struct TestTrips: Codable, Identifiable {
  
  let id = UUID()
  let category: String
  
  let whatActivity: String
  let whenActivity: String?
  let whereActivity: String?
  
  let whoActivity: String?
  let whyActivity: String?
  let howActivity: String?
  let linkActivity: String?
//  let imageActivity:
  
  enum CodingKeys : String, CodingKey {
    case id
    case category
    
    case whatActivity
    case whenActivity
    case whereActivity
    
    case whoActivity
    case whyActivity
    case howActivity
    case linkActivity
//    case imageActivity

}
  
  // MARK: Example for SwiftUI
  static let example = TestTrips(
    
                        category: "Travel",
                        
                        whatActivity: "WHAT: Fly to LAX from LGA",
                        whenActivity: "Tuesday, November 1 at 12:00pm to Friday, November 11 at 11:00am",
                        whereActivity: "WHERE: 1 World Way, Los Angeles, CA 90045",
                        
                        whoActivity: "WHO: All group members",
                        whyActivity: "WHY: Cheapest flight on Skyscanner with Spirit Airlines",
                        howActivity:"HOW-MUCH: $300 - $500 per round-trip ticket",
                        linkActivity: "[SkyScanner](https://www.skyscanner.com/)")
}
