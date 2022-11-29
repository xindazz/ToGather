////
////  TestMessagesView.swift
////  ToGather
////
////  Created by Lisa Leung on 11/29/22.
////
//
////
////  ContentView.swift
////  MailDemo
////
////  Created by Florent Morin on 29/06/2019.
////  Copyright © 2019 Morin Innovation. All rights reserved.
////
//// created with code from: https://stackoverflow.com/questions/62786204/sending-message-programmatically-with-swift
//// and  https://medium.com/@florentmorin/messageui-swiftui-and-uikit-integration-82d91159b0bd
//// and https://developer.apple.com/forums/thread/682621
//// Medium link: https://medium.com/@florentmorin/messageui-swiftui-and-uikit-integration-82d91159b0bd
//// Sample source code: https://github.com/florentmorin/SwiftUIAndMessageUI
//import SwiftUI
//import MessageUI
//
///// Main View
//struct TestMessagesView: View {
//
//    /// The delegate required by `MFMailComposeViewController`
//    private let mailComposeDelegate = MailDelegate()
//
//    /// The delegate required by `MFMessageComposeViewController`
//    private let messageComposeDelegate = MessageDelegate()
//
//
//    var body: some View {
//        VStack {
//            Spacer()
//            Button(action: {
//                self.presentMailCompose()
//            }) {
//                Text("Send email")
//            }
//            Spacer()
//            Button(action: {
//                self.presentMessageCompose()
//            }) {
//                Text("Send message")
//            }
//            Spacer()
//        }
//    }
//
//}
//
//// MARK: The mail part
//extension TestMessagesView {
//
//    /// Delegate for view controller as `MFMailComposeViewControllerDelegate`
//    private class MailDelegate: NSObject, MFMailComposeViewControllerDelegate {
//
//        func mailComposeController(_ controller: MFMailComposeViewController,
//                                   didFinishWith result: MFMailComposeResult,
//                                   error: Error?) {
//            <# Customize here #>
//            controller.dismiss(animated: true)
//        }
//
//    }
//
//    /// Present an mail compose view controller modally in UIKit environment
//    private func presentMailCompose() {
//        guard MFMailComposeViewController.canSendMail() else {
//            return
//        }
//        let vc = UIApplication.shared.keyWindow?.rootViewController
//
//        let composeVC = MFMailComposeViewController()
//        composeVC.mailComposeDelegate = mailComposeDelegate
//
//        <# Customize here #>
//
//        vc?.present(composeVC, animated: true)
//    }
//}
//
//// MARK: The message part
//extension TestMessagesView {
//
//    /// Delegate for view controller as `MFMessageComposeViewControllerDelegate`
//    private class MessageDelegate: NSObject, MFMessageComposeViewControllerDelegate {
//        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
//            // Customize here
//            controller.dismiss(animated: true)
//        }
//
//    }
//
//    /// Present an message compose view controller modally in UIKit environment
//    private func presentMessageCompose() {
//        guard MFMessageComposeViewController.canSendText() else {
//            return
//        }
////      keyWindow was deprecated, replaced with code from stack overflow
////        let vc = UIApplication.shared.keyWindow?.rootViewController
////      window was also deprecated
////        let vc = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController!
////     MARK: FIX THIS
//      
////      let vc = UIApplication.shared.UIWindowScene.filter { $0.isKeyWindow }.first?.rootViewController!
////commented this out
////      let composeVC = MFMessageComposeViewController()
////        composeVC.messageComposeDelegate = messageComposeDelegate
////
////        <# Customize here #>
////
////        vc?.present(composeVC, animated: true)
//    }
//}
//
//#if DEBUG
//struct TestMessagesView_Previews : PreviewProvider {
//    static var previews: some View {
//      TestMessagesView()
//    }
//}
//#endif
