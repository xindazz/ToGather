//
//  TestTabView.swift
//  ToGather
//
//  Created by Lisa Leung on 11/8/22.
//

import SwiftUI

struct TabView: View {
  var body: some View {
    TabView {
      ZStack {
        Color.green
          .opacity(0.1)
          .ignoresSafeArea()
        
        VStack {
          Text("Have the shape style touching the safe area edge.")
            .padding()
            .frame(maxHeight: .infinity)
          
          Rectangle()
            .fill(Color.clear)
            .frame(height: 10)
            .background(Color.green.opacity(0.2))
        }
        .font(.title2)
      }
      .tabItem {
        Image(systemName: "star")
        Text("Tab 1")
      }
      
      Text("Tab 2")
        .tabItem {
          Image(systemName: "moon")
          Text("Tab 2")
        }
      
      Text("Tab 3")
        .tabItem {
          Image(systemName: "sun.max")
          Text("Tab 3")
        }
      }
  }
}

struct TabView_Previews: PreviewProvider {
  static var previews: some View {
    TabView()
  }
}

