//
//  BackgroundColor.swift
//  ToGather
//
//  Created by Lisa Leung on 12/8/22.
//

import SwiftUI

struct BackgroundColor: View {
//  using code from SwiftRepos - 443 lab - to start

  var body: some View {
    //  MARK: example from https://sarunw.com/posts/how-to-set-screen-background-color-in-swiftui/
//      ZStack { // 1
//        Color.pink.ignoresSafeArea() // 2
//        VStack {
//            Text("Hello, SwiftUI!")
//                .font(.largeTitle)
//                .bold()
//            Button("Getting Started") {
//
//            }
//        }
//      }
//      .accentColor(Color.black)
//      .background(.teal)
    
    ZStack { // 1
//      MARK: linear gradient background from https://www.hackingwithswift.com/quick-start/swiftui/how-to-render-a-gradient
      LinearGradient(gradient: Gradient(colors: [.white, Color("reply"), Color("secondary")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()

//      MARK: solid background
//      Color("primary").ignoresSafeArea()
//      Color.pink.ignoresSafeArea() // 2
      VStack {
          Text("Hello, SwiftUI!")
              .font(.largeTitle)
              .bold()
          Button("Getting Started") {
              
          }
      }
    }
    .accentColor(Color.black)
    
  } //end body
  
 
} //end struct

struct BackgroundColor_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundColor()
  }
}
