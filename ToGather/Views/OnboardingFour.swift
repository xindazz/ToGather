


import Foundation

import SwiftUI


struct OnboardingFour: View {
    
    
    
    @State private var textFieldContent = ""
    @State private var textFieldContent2 = ""
    @State private var date = Date()

    var body: some View {
        
        ZStack {
            
            VStack (spacing:20){
                
                
                Text("Create a trip")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))

                
                Text("Add whatever details you've figured out (you can go back and change this later")
                
//                Text("hj")
                
                Text("Trip Name")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                TextField("Graduation!", text: $textFieldContent)
                    .textContentType(.givenName).border(Color.gray.opacity(0.5))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                Text("Destination")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                TextField("New York", text: $textFieldContent2)
                    .textContentType(.givenName).border(Color.gray.opacity(0.5))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                Text("Dates")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                DatePicker(selection: .constant(Date()), label: { Text("From") })
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                DatePicker(selection: .constant(Date()), label: { Text("To") })
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                
                DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))

                    
                
                    
                }
            }
        }
}



