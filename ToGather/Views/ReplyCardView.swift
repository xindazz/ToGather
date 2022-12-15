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
//        if reply.event.name != nil {
//          Text("WHAT")
//            .font(.headline)
//          Text("\(reply.event.name!)")
//        }
//        if reply.event.category != nil {
//          Text("CATEGORY")
//            .font(.headline)
//          Text("\(reply.event.category!)")
//        }
//        if reply.event.location != nil {
//          Text("WHERE")
//            .font(.headline)
//          Text("\(reply.event.location!)")
//        }
//        if reply.event.from != nil {
//          Text("FROM")
//            .font(.headline)
//          Text("\(formatter.toDateTime(reply.event.from!))")
//        }
//        if reply.event.to != nil {
//          Text("TO")
//            .font(.headline)
//          Text("\(formatter.toDateTime(reply.event.to!))")
//        }
//        if reply.event.detail != nil {
//          Text("Comment")
//            .font(.headline)
//          Text("\(reply.event.detail!)")
//        }
//        Text("Comment")
//          .font(.custom("NunitoSans-SemiBold", size: 18))
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
