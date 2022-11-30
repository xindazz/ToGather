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
    
    var body: some View {
        
        
        
        
        TabView {
            VStack {
                Text("Hello, World!")
                Divider()
                Spacer()
                // Bleeds into TabView
                Rectangle()
                    .frame(height: 0)
                    .background(.thinMaterial)
            }
            .background(Color.purple)
            .tabItem {
                Text("Tab 1")
                Image(systemName: "wifi")
            }
        }
    }
}

//
//
//        TabView {
//            VStack {
//
//                VStack{
//                    Text("Join a trip")
//                        .font(.title)
//                        .padding()
//                } // end inner vstack
//
//                Spacer()
//                VStack (alignment: .leading){
//                    Text("Enter Unique Code")
//                        .font(.title2)
//
//                    TextField("123456", text: $code)
//                        .textContentType(.givenName).border(Color.gray.opacity(0.5))
//                        .frame(width: 350, height: 50)
//
//                } //end inner vstack
//                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 30))
//
//                Spacer()
//                Button {
//                    repo.joinTrip(code: code)
//                } label: {
//                    Text("Join Trip")
//                        .frame(width: 350, height:50)
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .background(Color(UIColor.systemBlue))
//                        .clipShape(RoundedRectangle(cornerRadius: 12))
//                        .padding(5)
//
//
//                } // end VStack
//
//                Divider()
//                Spacer()
//                // Bleeds into TabView
//                Rectangle()
//                    .frame(height: 0)
//                    .background(.thinMaterial)
//            }
//
//
//
//
//
//        }
//    }
//
//
//}
