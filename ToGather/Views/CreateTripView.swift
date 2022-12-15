//
//  OnboardingThree.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.



import SwiftUI


struct CreateTripView: View {
  
  @ObservedObject var repo: UserRepository
  
  @State private var name = ""
  @State private var destination = ""
  @State private var startDate = Date()
  @State private var endDate = Date()
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    ZStack{
      Color("secondary").ignoresSafeArea()
      
      VStack (alignment: .leading){
        
        ScrollView{
          VStack {
            VStack {
              Text("Create a trip")
                .font(.custom("NunitoSans-Bold", size: 30))
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                .foregroundColor(.white)
              
              
              Text("Start planning your trip! \n Add all the details you've figured out so far (you can come back and change it later.)")
                .multilineTextAlignment(.center)
                .font(.custom("NunitoSans-Regular", size: 18))
                .padding(EdgeInsets(top: 1, leading: 10, bottom: 0, trailing: 10))
                .foregroundColor(.white)
              
            } // end Vstack
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
            VStack (alignment: .leading){
              Text("Trip Name")
                .font(.custom("NunitoSans-SemiBold", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
              
              TextField("Graduation!", text: $name)
                .textContentType(.givenName).border(Color.gray.opacity(0.5))
                .background(Color(.white))
              
              Text("Destination")
                .font(.custom("NunitoSans-SemiBold", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 10))
              
              TextField("New York", text: $destination)
                .textContentType(.givenName).border(Color.gray.opacity(0.5))
                .background(Color(.white))
              
              Text("Dates")
                .font(.custom("NunitoSans-SemiBold", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 10))
                .foregroundColor(.white)
              
              DatePicker(selection: $startDate, label: { Text("Start Date") })
                .foregroundColor(.white)
              
              DatePicker(selection: $endDate, label: { Text("End Date") })
                .foregroundColor(.white)
              
            } // end VStack
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            Button {
              //        let uniqueCode = repo.getUniqueCode()
              var newTrip = Trip(name: name, uniqueCode: "", owner: repo.user, destination: destination, from: startDate, to: endDate)
              newTrip.addMember(user: repo.user)
              repo.createTrip(trip: newTrip)
              self.presentationMode.wrappedValue.dismiss()
            } label: {
              Text("Create Trip")
                .frame(width: 350, height:50)
                .font(.custom("NunitoSans-Bold", size: 18))
                .foregroundColor(.white)
                .background(Color("primary"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(5)
                .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 20))
            }
          }
        } // end outer-most vstack
      } // end scrollview
    } // end vstack
  } // end zstack
}//end body


struct CreateTripView_Previews: PreviewProvider {
  static var previews: some View {
    CreateTripView(repo: UserRepository())
  }
}








