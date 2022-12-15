//
//  JoinTripView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/8/22.
//
import Foundation
import SwiftUI


struct JoinTripView: View {
  
  @ObservedObject var repo: UserRepository
  @State private var code = ""
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    TabView {
      VStack {
        VStack{
          Text("Join a Trip")
            .font(.custom("NunitoSans-Bold", size: 32))
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 30))
        } // end inner vstack
        Spacer()
        VStack (alignment: .leading){
          Text("Enter Your Trip's Unique Code")
            .font(.custom("NunitoSans-SemiBold", size: 24))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .foregroundColor(.white)
          Text("This is a 6-digit code you should have received via SMS.")
            .font(.custom("NunitoSans-Light", size: 18))
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
            .foregroundColor(.white)
          TextField(" 123456", text: $code)
            .textContentType(.givenName).border(Color.gray.opacity(0.5))
            .background(Color(.white))
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

        Spacer()
        
        Button {
          repo.joinTrip(code: code)
          self.presentationMode.wrappedValue.dismiss()
        } label: {
          Text("Join Trip")
            .frame(width: 350, height:50)
            .font(.custom("NunitoSans-Bold", size: 18))
            .foregroundColor(.white)
            .background(Color("primary"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
        }
        
        Spacer()
        // Bleeds into TabView

        Rectangle()
          .frame(height: 0)
      }
      .background(Color("blue"))
    }
  }
}






struct JoinTripView_Previews: PreviewProvider {
  static var previews: some View {
    JoinTripView(repo: UserRepository())
  }
}
