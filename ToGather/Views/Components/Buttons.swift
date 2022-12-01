//
//  Buttons.swift
//  ToGather
//
//  Created by Lisa Leung on 11/8/22.
//
import SwiftUI

struct Buttons: View {
//  using code from SwiftRepos - 443 lab - to start
  
  var body: some View {
//    trip header and nav
//    MARK: UI-SPECIFIC: use this
//    MARK: break down everything below into sub-files later


    ScrollView {
//      MARK: for trip proposal card: yes/no hstack
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
      VStack {
//        MARK: small poll buttons
        // half-sized button
        Button(action: {}) {
           Spacer()
          Label("Add Trip Details", systemImage: "plus.circle")
               .font(.headline)
               .padding()
               .foregroundColor(.white)
           Spacer()
        }
//        .frame(width: 300, height:200)
         .background(Color(UIColor.systemBlue))
         .clipShape(RoundedRectangle(cornerRadius: 12))
         .padding()
        HStack{ //yes/no hstack
          Button(action: {}) {
             Spacer()
            Label("Yes", systemImage: "plus.circle")
                 .font(.headline)
                 .padding()
                 .foregroundColor(.white)
             Spacer()
          }
          .frame(width: 160)
           .background(Color(UIColor.systemBlue))
           .clipShape(RoundedRectangle(cornerRadius: 12))
           .padding()
          Button(action: {}) {
             Spacer()
            Label("No", systemImage: "plus.circle")
                 .font(.headline)
                 .padding()
                 .foregroundColor(.white)
             Spacer()
          }
          .frame(width: 160)
           .background(Color(UIColor.systemBlue))
           .clipShape(RoundedRectangle(cornerRadius: 12))
           .padding()
        } // end hstack
        
        // MARK: trip selection button
        Button(action: {}) {
//          Spacer()
          VStack{
            Text("New York City")
             .font(.headline)
             .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
             .foregroundColor(.white)
            Text("September 10-24, 2022")
            .font(.subheadline)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
            .foregroundColor(.white)
          }//end vstack
//           Spacer()
        } // end button
         .frame(width: 300, height:150)
         .background(Color(UIColor.systemBlue))
         .clipShape(RoundedRectangle(cornerRadius: 12))
         .padding(10)
        //    MARK: wide buttons

        // wide button
        Button(action: {}) {
           Spacer()
          Label("Add Trip Details", systemImage: "plus.circle")
               .font(.headline)
               .padding()
               .foregroundColor(.white)
           Spacer()
        }.frame(width: 300, height:200)
         .background(Color(UIColor.systemBlue))
         .clipShape(RoundedRectangle(cornerRadius: 12))
         .padding()
//        wide button #2 
        Button(action: {}) {
           Spacer()
          Label("Add Trip Details", systemImage: "plus.circle")
               .font(.headline)
               .padding()
               .foregroundColor(.white)
           Spacer()
        }.frame(width: 350, height: 90)
         .background(Color(UIColor.systemBlue))
         .clipShape(RoundedRectangle(cornerRadius: 12))
         .padding()

// normal button
        Button(action: {}) {
           Spacer()
          Label("Add Trip Details", systemImage: "plus.circle")
               .font(.headline)
               .padding()
               .foregroundColor(.white)
           Spacer()
        }
         .background(Color(UIColor.systemBlue))
         .clipShape(RoundedRectangle(cornerRadius: 12))
         .padding()
      } //end Vstack


    } //end scroll view
    
    
  } //end body
  
 
} //end struct

struct Buttons_Previews: PreviewProvider {
  static var previews: some View {
    Buttons()
  }
}
