//
//  YourProfileView.swift
//  ToGather
//
//  Created by Lisa Leung on 12/12/22.
//

import SwiftUI

struct YourProfileView: View {

  @ObservedObject var repo: UserRepository
  var profilePics = ["man1", "man2", "woman1", "woman2"]
  
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
            
            Image(profilePics[abs(repo.user.name.hashValue) % 4])
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .frame(width: 150, height: 150)
            
            Text("Username")
              .font(.custom("NunitoSans-SemiBold", size: 24))
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 10))
              .foregroundColor(.white)
            
            Text("\(repo.user.name ?? "Your Name")")
              .font(.custom("NunitoSans-Regular", size: 18))
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              .foregroundColor(.white)
            
            Text("Email")
              .font(.custom("NunitoSans-SemiBold", size: 24))
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 10))
              .foregroundColor(.white)
            
            Text("\(repo.user.email ?? "Your Email")")
              .font(.custom("NunitoSans-Regular", size: 18))
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              .foregroundColor(.white)
            
            
          } // end vstack
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
          
          
          VStack {
            
            Button {
              repo.load()
            } label: {
              Text("Refresh")
                .frame(width: 350, height:50)
                .font(.custom("NunitoSans-Bold", size: 18))
                .foregroundColor(.white)
                .background(Color("primary"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(5)
                .padding(EdgeInsets(top: 100, leading: 20, bottom: 0, trailing: 20))
            }
            Button {
              repo.signOut()
            } label: {
              Text("Sign Out")
                .frame(width: 350, height:50)
                .font(.custom("NunitoSans-Bold", size: 18))
                .foregroundColor(.white)
                .background(Color("primary"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(5)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
            }
          }
          
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

