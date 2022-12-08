//
//  ProposalCard.swift
//  ToGather
//
//  Created by Lisa Leung on 11/8/22.
//

import SwiftUI
//MARK: used code from: https://www.hackingwithswift.com/quick-start/swiftui/how-to-render-a-gradient and https://www.hackingwithswift.com/books/ios-swiftui/gradients
struct ProposalCard: View {
//  using code from SwiftRepos - 443 lab - to start
//  MARK: colors have not been configured to the design system
  var body: some View {
    ScrollView {
      //    MARK: working on incorporating color and contrast
      VStack(alignment: .leading, spacing: 32) {
        VStack(alignment: .leading) {
              Text("Fly to LAX from LGA")
                  .font(.largeTitle.bold())
              Text("Travel")
                  .font(.subheadline)
                  .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))

              Text("Nov 19, 2022 12:59pm to")
              Text("Nov 20, 2022 12:59pm")
          } // end inner vstack
          .foregroundColor(.black)
      } //end outer vstack
      .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
      .background(
              Rectangle()
                  .fill(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                  )
                  .frame(width: 375)
                  .cornerRadius(12)
                  .shadow(
                      color: Color.gray.opacity(0.7),
                      radius: 8,
                      x: 0,
                      y: 0
                  )
        )
      //    MARK: template
      VStack(alignment: .leading, spacing: 32) {
        VStack(alignment: .leading) {
              Text("Fly to LAX from LGA")
                  .font(.largeTitle.bold())
              Text("Travel")
                  .font(.subheadline)
                  .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))

              Text("Nov 19, 2022 12:59pm to")
              Text("Nov 20, 2022 12:59pm")
          } // end inner vstack
          .foregroundColor(.black)
      } //end outer vstack
      .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
      .background(
              Rectangle()
                  .fill(Color.gray)
                  .frame(width: 375)
                  .cornerRadius(12)
                  .shadow(
                      color: Color.gray.opacity(0.7),
                      radius: 8,
                      x: 0,
                      y: 0
                  )
        )
//      .background(
//              Image("[london]marcin-nowak-iXqTqC-f6jI-unsplash")
//                .resizable()
//                .frame(width: 375)
//                .cornerRadius(12)
//                .shadow(
//                    color: Color.gray.opacity(0.7),
//                    radius: 8,
//                    x: 0,
//                    y: 0
//                )
//        )
      
  //    .background(
  //            Rectangle()
  //                .fill(Color.gray)
  //                .frame(width: 375)
  //                .cornerRadius(12)
  //                .shadow(
  //                    color: Color.gray.opacity(0.7),
  //                    radius: 8,
  //                    x: 0,
  //                    y: 0
  //                )
  //      )
      
      //    template
      VStack(alignment: .leading, spacing: 32) {
        VStack(alignment: .leading) {
              Text("Fly to LAX from LGA")
                  .font(.largeTitle.bold())
              Text("Travel")
                  .font(.subheadline)
              Text("Nov 19, 2022 12:59pm to")
              Text("Nov 20, 2022 12:59pm")
          } // end inner vstack
          .foregroundColor(.black)
        
        HStack{ //yes/no hstack
          Button(action: {}) {
             Spacer()
            Label("Yes", systemImage: "hand.thumbsup")
                 .font(.headline)
                 .padding()
                 .foregroundColor(.white)
             Spacer()
          }
          .frame(width: 120)
           .background(Color(UIColor.systemBlue))
           .clipShape(RoundedRectangle(cornerRadius: 12))
           .padding()
          Button(action: {}) {
             Spacer()
            Label("No", systemImage: "hand.thumbsdown")
                 .font(.headline)
                 .padding()
                 .foregroundColor(.white)
             Spacer()
          }
           .frame(width: 120)
           .background(Color(UIColor.systemBlue))
           .clipShape(RoundedRectangle(cornerRadius: 12))
           .padding()
        } // end hstack
        
          
      } //end outer vstack
      .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
      .background(
              Image("[london]marcin-nowak-iXqTqC-f6jI-unsplash")
                .resizable()
                .frame(width: 375)
                .cornerRadius(12)
                .shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 8,
                    x: 0,
                    y: 0
                )
        )
  //    .background(
  //            Rectangle()
  //                .fill(Color.gray)
  //                .frame(width: 375)
  //                .cornerRadius(12)
  //                .shadow(
  //                    color: Color.gray.opacity(0.7),
  //                    radius: 8,
  //                    x: 0,
  //                    y: 0
  //                )
  //      )
// MARK: replies [in-development]
      VStack (alignment: .leading){
        VStack (alignment: .leading){
//          Text("Sender: Brandon Woo")
          Label("Sender: Brandon Woo", systemImage: "arrowshape.turn.up.left")

          Divider()
        }
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
        VStack (alignment: .leading, spacing: 10){
          Text("Category: WHAT")
            .font(.headline)
          Text("Fly from DCA to LAX")
          Text("Category: Comment")
            .font(.headline)
          Text("Cheaper than flying from LGA in NYC ")
        }
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
       
      }
      .frame(width: 300, height: .infinity)
      .background(Color(UIColor.systemGreen))
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .padding(EdgeInsets(top: 10, leading: 90, bottom: 20, trailing: 15))
// MARK: card template
      VStack (alignment: .leading) {
        VStack (alignment: .leading, spacing: 20) {
          Text("Tuesday, November 1 at 12:00pm to")
            .font(.subheadline)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
          Text("Friday, November 11 at 11:00am")
            .font(.subheadline)
            .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
          Divider()
        } // end vstack
        .background(Color(UIColor.systemBlue))

        VStack (alignment: .leading, spacing: 10){
          Text("WHAT: Fly to LAX from LGA")
            .font(.headline)
          Text("Category: Travel")
            .font(.subheadline)
          Text("WHERE: 1 World Way, Los Angeles, CA 90045")
          Text("WHO: All group members")
          Text("HOW-MUCH: $300 - $500 per round-trip ticket")
          Text("WHY: Cheapest flight on Skyscanner with Spirit Airlines")
          Text("[SkyScanner](https://www.skyscanner.com/)")
          Image("skyscanner-lax-to-lga")
            .resizable()
            .scaledToFit()
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
          
        }
        .padding(.leading, 20)
        
        HStack {
          Button(action: {}) {
            Spacer()
            Label("Yes", systemImage: "hand.thumbsup")
              .font(.headline)
              .padding()
              .foregroundColor(.white)
            Spacer()
          }
          .frame(width: 105, height: 50)
          .background(Color(UIColor.systemBlue))
          .clipShape(RoundedRectangle(cornerRadius: 12))
  //        .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 0))
          
          Button(action: {}) {
            Spacer()
            Label("No", systemImage: "hand.thumbsdown")
              .font(.headline)
              .padding()
              .foregroundColor(.white)
            Spacer()
          }
          .frame(width: 105, height: 50)
          .background(Color(UIColor.systemBlue))
          .clipShape(RoundedRectangle(cornerRadius: 12))
  //        .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 0))
          
          Button(action: {}) {
            Spacer()
            Label("Edit", systemImage: "pencil")
              .font(.headline)
              .padding()
              .foregroundColor(.white)
            Spacer()
          }
          .frame(width: 105, height: 50)
          .background(Color(UIColor.systemBlue))
          .clipShape(RoundedRectangle(cornerRadius: 12))
  //        .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 0))
        } //end HStack
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 0))
          
      } // end VStack
      .background(Color(UIColor.systemGray))
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
// MARK: template card + replies
      VStack (alignment: .leading) {
        VStack (alignment: .leading, spacing: 20) {
          Text("Tuesday, November 1 at 12:00pm to")
            .font(.subheadline)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
          Text("Friday, November 11 at 11:00am")
            .font(.subheadline)
            .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
          Divider()
        } // end vstack
        .background(Color(UIColor.systemBlue))

        VStack (alignment: .leading, spacing: 10){
          Text("WHAT: Fly to LAX from LGA")
            .font(.headline)
          Text("Category: Travel")
            .font(.subheadline)
          Text("WHERE: 1 World Way, Los Angeles, CA 90045")
          Text("WHO: All group members")
          Text("HOW-MUCH: $300 - $500 per round-trip ticket")
          Text("WHY: Cheapest flight on Skyscanner with Spirit Airlines")
          Text("[SkyScanner](https://www.skyscanner.com/)")
          Image("skyscanner-lax-to-lga")
            .resizable()
            .scaledToFit()
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
          
        }
        .padding(.leading, 20)
        
        HStack {
          Button(action: {}) {
            Spacer()
            Label("Reply", systemImage: "arrowshape.turn.up.left")
              .font(.headline)
              .padding()
              .foregroundColor(.white)
            Spacer()
          }
          .frame(width: 325, height: 50)
          .background(Color(UIColor.systemBlue))
          .clipShape(RoundedRectangle(cornerRadius: 12))
        } //end HStack
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
          
      } // end VStack
      .background(Color(UIColor.systemGray))
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
// MARK: published card (no buttons)
      VStack (alignment: .leading) {
        VStack (alignment: .leading, spacing: 20) {
          Text("Tuesday, November 1 at 12:00pm to")
            .font(.subheadline)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
          Text("Friday, November 11 at 11:00am")
            .font(.subheadline)
            .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 0))
          Divider()
        } // end vstack
        .background(Color(UIColor.systemBlue))
        
        VStack (alignment: .leading, spacing: 10){
          Text("WHAT: Fly to LAX from LGA")
            .font(.headline)
          Text("Category: Travel")
            .font(.subheadline)
          Text("WHERE: 1 World Way, Los Angeles, CA 90045")
          Text("WHO: All group members")
          Text("HOW-MUCH: $300 - $500 per round-trip ticket")
          Text("WHY: Cheapest flight on Skyscanner with Spirit Airlines")
          Text("[SkyScanner](https://www.skyscanner.com/)")
          Image("skyscanner-lax-to-lga")
            .resizable()
            .scaledToFit()
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
          
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0))
        
      } //end vstack
      .background(Color(UIColor.systemGray))
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
// MARK: exploring the replies
    } //end scroll view
        
    
  } //end body
  
 
} //end struct

struct ProposalCard_Previews: PreviewProvider {
  static var previews: some View {
    ProposalCard()
  }
}
