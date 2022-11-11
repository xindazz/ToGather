//
//  OnboardingOne.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//



import Foundation
import SwiftUI

struct RadioButtonField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let bgColor: Color
    let textSize: CGFloat
    let isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 20,
        color: Color = Color.black,
        bgColor: Color = Color.black,
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.bgColor = bgColor
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .clipShape(Circle())
                    .foregroundColor(self.bgColor)
                Text(label)
                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}


struct OnboardingOne: View {


//    @ObservedObject var viewController = ViewController()
    @State var inputTemp: String = ""
    
    @State private var textFieldContent = ""
    @State private var textFieldContent2 = ""



    @State var contact = ""



    var body: some View {

        ZStack {

                VStack(spacing: 40) {
                    Text("Welcome to ToGather")
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .font(.body)


                    Text("Let's go on a trip together")
                    
                    
                    Text("Name")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                    
                    TextField("User name", text: $textFieldContent)
                        .textContentType(.givenName).border(Color.gray.opacity(0.5))
                      
                    
                    Text("Preferred Mode of Contact").frame(maxWidth: .infinity, alignment: .leading)

                    
                    VStack{
                                    RadioButtonField(
                                        id: "Text Message",
                                        label: "Text Message",
                                        color:.red,
                                        bgColor: .blue,
                                        isMarked: $contact.wrappedValue == "Text Message" ? true : false,
                                        callback: { selected in
                                            self.contact = selected
                                            print("Selected Gender is: \(selected)")
                                        }
                                    )
                                    RadioButtonField(
                                        id: "Messenger",
                                        label: "Messenger",
                                        color:.red,
                                        bgColor: .blue,
                                        isMarked: $contact.wrappedValue == "Messenger" ? true : false,
                                        callback: { selected in
                                            self.contact = selected
                                            print("Selected Gender is: \(selected)")
                                        }
                                    )
                        RadioButtonField(
                            id: "Discord",
                            label: "Discord",
                            color:.red,
                            bgColor: .blue,
                            isMarked: $contact.wrappedValue == "Discord" ? true : false,
                            callback: { selected in
                                self.contact = selected
                                print("Selected Gender is: \(selected)")
                            }
                        )
                        
                        
                                }
                    
                    Text("Handle/Number")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                    
                    TextField("@discord", text: $textFieldContent2)
                        .textContentType(.givenName).border(Color.gray.opacity(0.5))

                  
                  NavigationLink(destination: OnboardingTwo()) {
                    Button(action: {}) {
                       Spacer()
                       Text("Get Started")
                           .font(.headline)
                           .padding()
                           .foregroundColor(.white)
                       Spacer()
                    } // end button
                     .background(Color(UIColor.systemBlue))
                     .clipShape(RoundedRectangle(cornerRadius: 12))
                     .padding()
                  } //end navlink
                  
                }
                    Spacer()
        

            }
                .padding()
            }
        }

struct OnboardingOne_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingOne()
  }
}
