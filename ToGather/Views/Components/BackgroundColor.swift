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
    ZStack {
            Rectangle()
                .fill(Gradient(colors: [.indigo, .purple]))
                .ignoresSafeArea()
            Text("four").font(.system(size: 100))
                .foregroundColor(.white)
    }
    
  } //end body
  
 
} //end struct

struct BackgroundColor_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundColor()
  }
}
