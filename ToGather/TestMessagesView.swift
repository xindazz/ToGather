//
//  TestMessagesView.swift
//  ToGather
//
//  Created by Lisa Leung on 11/29/22.
//
// sendMessage function from Helena Spencer, 67-443 TA
import SwiftUI

struct TestMessagesView: View {
  
  func sendMessage(){
    let sms: String = "sms:&body=Join this event with me! \n Event: something \n Date: something"
    let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
   }
  var body: some View {
    VStack{
      Button(action: {sendMessage()}) {
         Spacer()
        Label("Message Me", systemImage: "plus.circle")
             .font(.headline)
             .padding()
             .foregroundColor(.white)
         Spacer()
      }
    } //end VStack
    
  } // end body
}

