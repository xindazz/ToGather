//
//  YourProfileView.swift
//  ToGather
//
//  Created by Lisa Leung on 12/12/22.
//

import SwiftUI

struct YourProfileView: View {

  @ObservedObject var repo: UserRepository
  
  var body: some View {
    
    ZStack {
      
      Color("secondary").ignoresSafeArea()

      
      ScrollView {
        VStack {
          Text("Your Profile")
            .font(.custom("NunitoSans-Bold", size: 30))
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .foregroundColor(.white)
          
          VStack (alignment: .leading){
            
            Image("woman2")
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .frame(width: 150, height: 150)
            
            Text("Username")
              .font(.custom("NunitoSans-SemiBold", size: 24))
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 10))
              .foregroundColor(.white)
            
            Text("name")
              .font(.custom("NunitoSans-Regular", size: 18))
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              .foregroundColor(.white)
            
            Text("Email")
              .font(.custom("NunitoSans-SemiBold", size: 24))
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 10))
              .foregroundColor(.white)
            
            Text("email")
              .font(.custom("NunitoSans-Regular", size: 18))
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              .foregroundColor(.white)
            
          } // end vstack
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

          
        } // end outermost vstack
      } // end scrollview
      
    } // end zstack
    
  } //end body
  
 
} //end struct

struct YourProfileView_Previews: PreviewProvider {
  static var previews: some View {
    YourProfileView(repo: UserRepository())
  }
}

