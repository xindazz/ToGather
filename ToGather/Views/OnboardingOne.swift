
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
    
    
    @ObservedObject var viewController = ViewModel()
    @State var inputTemp: String = ""
    
    @State private var textFieldContent = ""
    @State private var textFieldContent2 = ""
    
    
    
    @State var contact = ""
    @State private var showWelcomeView = false
    
    
    var body: some View {
        
        NavigationView{

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
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                TextField("User name", text: $textFieldContent)
                    .textContentType(.givenName).border(Color.gray.opacity(0.5))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                Text("Preferred Mode of Contact").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                
                VStack{
                    RadioButtonField(
                        id: "Text Message",
                        label: "Text Message",
                        color:.black,
                        bgColor: .black,
                        isMarked: $contact.wrappedValue == "Text Message" ? true : false,
                        callback: { selected in
                            self.contact = selected
                            print("Selected Gender is: \(selected)")
                        }
                    )
                    RadioButtonField(
                        id: "Messenger",
                        label: "Messenger",
                        color:.black,
                        bgColor: .black,
                        isMarked: $contact.wrappedValue == "Messenger" ? true : false,
                        callback: { selected in
                            self.contact = selected
                            print("Selected Gender is: \(selected)")
                        }
                    )
                    RadioButtonField(
                        id: "Discord",
                        label: "Discord",
                        color:.black,
                        bgColor: .black,
                        isMarked: $contact.wrappedValue == "Discord" ? true : false,
                        callback: { selected in
                            self.contact = selected
                            print("Selected Gender is: \(selected)")
                        }
                    )
                    
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                Text("Handle/Number")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                
                TextField("@discord", text: $textFieldContent2)
                    .textContentType(.givenName).border(Color.gray.opacity(0.5))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
            
                
                NavigationLink("Get Started", destination: OnboardingTwo())
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .frame(width: 350, height: 80)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))             }
                .cornerRadius(30)
                .padding(.bottom)
            
                }
            }
        }
            
    }
        


    


