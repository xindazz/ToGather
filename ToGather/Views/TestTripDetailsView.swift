////
////  TestTripDetailsView.swift
////  ToGather
////
////  Created by Lisa Leung on 11/4/22.
////
//
//import SwiftUI
//
//struct TestTripDetailsView: View {
//// MARK: FOR TESTING PURPOSES ONLY - based off of SwiftRepos Lab
//  var trip: TestTrips2
//  var body: some View {
////    trip header and nav
////    MARK: this uses older dashboard ui for the sake of example
//
//// MARK: trip header
//    VStack (alignment: .leading) {
//      Spacer()
//      Text("NYC Trip")
//        .font(.largeTitle)
//        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
//      Text("September 10-14, 2022")
//        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
//
//      Divider()
////    MARK: members block
//      VStack (alignment: .leading){
//        Text("Members").font(.headline)
//          .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
//        HStack {
//          VStack {
//            Image("ben-den-engelsen-unsplash")
//              .resizable()
//              .scaledToFit()
//              .clipShape(Circle())
//              .frame(width: 100, height: 100)
//            VStack(alignment: .trailing) {
//               Text("Brandon Woo")
//                 .font(.caption)
//             } //end VStack
//          } //end Vstack
//          VStack {
//            Image("michael-dam-unsplash")
//              .resizable()
//              .scaledToFit()
//              .clipShape(Circle())
//              .frame(width: 100, height: 100)
//            VStack(alignment: .trailing) {
//               Text("Diana Prince")
//                 .font(.caption)
//             } //end VStack
//          } //end Vstack
//
//        }//end hstack
//        .padding(EdgeInsets(top: -10, leading: 20, bottom: 10, trailing: 0))
//      } // end vstack
//
////    MARK: trip details block
//      VStack (alignment: .leading){
//        Text("Trip Details").font(.title)
//          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
//
//        Button(action: {}) {
//           Spacer()
//          Label("Add Trip Details", systemImage: "plus.circle")
//               .font(.headline)
//               .padding()
//               .foregroundColor(.white)
//           Spacer()
//        }
//         .background(Color(UIColor.systemBlue))
//         .clipShape(RoundedRectangle(cornerRadius: 12))
//         .padding()
//
////        MARK: Trip Activities Block
//        Section(header: Text("blank header"), content: {
////          MARK: need to resolve this loop by unpacking the contents + correctly nil coalescing
////          not sure how this will happen
//          ForEach(trip.itinerary.sorted(by: { ($0.last as? Date ?? Date.distantFuture) < ($1.last as? Date ?? Date.distantPast)}) ?? TestTripActivity.example0) { activity in
//              TestTripDetailsRowView(activity: activity)
//            }
////          ForEach(location.scans.sorted(by: { $0 < $1 })) { scan in
////            ScanView(scan: scan)
////          }
//        })
//
////
////        Text(trip.category).font(.title2)
////          .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
////        Spacer()
////        Spacer()
////        VStack (alignment: .leading, spacing: 20){
//////          MARK: make sure to split into start date and end date to prevent UI issues!!!!
////          Text(trip.whenActivity ?? "").font(.headline)
////
////          Text(trip.whatActivity).font(.subheadline)
////          Text(trip.category).font(.subheadline)
////          Text(trip.whereActivity ?? "")
////          Text(trip.whoActivity ?? "")
////          Text(trip.howActivity ?? "")
////          // iterate through a list of links
////          Text(trip.linkActivity ?? "")
////
//          // iterate through a list of images (somehow)
//          Image("skyscanner-lax-to-lga")
//            .resizable()
//            .scaledToFit()
//          Spacer()
////        } // end VStack
//        .padding(.leading, 20)
//
//      } // end VStack
//
//    } //end vstack
//
//  } //end body
//
//
//} //end struct
//
//struct TestTripDetailsView_Previews: PreviewProvider {
//  static var previews: some View {
//    TestTripDetailsView(trip: TestTrips2.example1)
//  }
//}
