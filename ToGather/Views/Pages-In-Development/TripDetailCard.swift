//
//  TripDetailCard.swift
//  ToGather
//
//  Created by Lisa Leung on 11/3/22.
//


// modified from Ricardo Montemayor's repo to understand custom view components: https://github.com/ricardomongza99/Cities/blob/main/Cities/Views/CityCard.swift
// and paul hudson https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-images-and-other-views-as-a-backgrounds
// [london]marcin-nowak-iXqTqC-f6jI-unsplash

import SwiftUI

struct TripDetailCard: View {
  var body: some View {
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
    ScrollView{
      
      VStack(alignment: .leading, spacing: 32) {
          VStack(alignment: .leading) {
              Text("Fly to LAX from LGA")
                  .font(.largeTitle.bold())
              Text("Travel")
                  .font(.subheadline)
          } // end inner vstack
          .foregroundColor(.white)
        
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
  //    .frame(width: 300)
  //
  //    .padding(EdgeInsets(top: 10, leading: 50, bottom: 0, trailing: 50))
  //    .cornerRadius(16)
  //    .background(.gray)
  //    .shadow(color: .gray, radius: 8, x: 4, y: 4)
  //    background photo
      VStack(alignment: .leading, spacing: 32) {
          VStack(alignment: .leading) {
              Text("Fly to LAX from LGA")
                  .font(.largeTitle.bold())
              Text("Travel")
                  .font(.subheadline)
          } // end inner vstack
          .foregroundColor(.white)
        
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
        )
      
    } //end scroll
    
  } //end body

}
struct TripDetailCard_Previews: PreviewProvider {
  static var previews: some View {
    TripDetailCard()
  }
}
