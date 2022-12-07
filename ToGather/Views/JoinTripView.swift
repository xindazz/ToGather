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
          Text("Join a trip")
            .fontWeight(.bold)
            .font(.title)
            .padding()
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 30))
        } // end inner vstack
        
        VStack (alignment: .leading){
          Text("Enter Unique Code")
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 10))
            .font(.title2)
            .foregroundColor(.white)
          
          TextField("123456", text: $code)
            .textContentType(.givenName).border(Color.gray.opacity(0.5))
            .background(Color(.white))
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 10))
        }
        
        Button {
          repo.joinTrip(code: code)
          self.presentationMode.wrappedValue.dismiss()
        } label: {
          Text("Join Trip")
            .frame(width: 350, height:50)
            .font(.headline)
            .foregroundColor(.white)
            .background(Color("buttoncolor"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 10))
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
