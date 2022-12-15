//
//  ReplyCardView.swift
//  ToGather
//
//  Created by Xinda Zhou on 11/9/22.
//

import SwiftUI


struct ReplyCardView: View {
  var reply: Reply
  var formatter = CustomDateFormatter()
  
  var body: some View {
    VStack (alignment: .leading){
      VStack (alignment: .leading){
        //          Text("Sender: Brandon Woo")
        Label("Sender: \(reply.replier.name)", systemImage: "arrowshape.turn.up.left")
          .font(.custom("NunitoSans-Regular", size: 18))
        
        Divider()
      }
      .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
      VStack (alignment: .leading){
        
        Text("\(reply.comment)")
          .font(.custom("NunitoSans-SemiBold", size: 18))
          .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))

      }
      .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
      
    }
    .background(Color("reply"))
    .clipShape(RoundedRectangle(cornerRadius: 12))
    .padding(EdgeInsets(top: 10, leading: 90, bottom: 20, trailing: 15))
  }
}

struct ReplyCardView_Previews: PreviewProvider {
  static var previews: some View {
    ReplyCardView(reply: Reply.example)
  }
}
