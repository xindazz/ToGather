//
//
//
//
//
//import Foundation
//
//import SwiftUI
////MARK:- Radio Button Field
//
//
//
//
//struct ChecklistOne: View {
//    
//    var repo: UserRepository
//    var trip: Trip
//    
//    
//    @State private var textFieldContent = ""
//    @State private var textFieldContent2 = ""
//    
//    @State private var datesave = Date
//    
//
//    @State var value = ""
//    var placeholder = "Select Client"
//    var dropDownList = ["PSO", "PFA", "AIR", "HOT"]
//    
//        
//    var body: some View {
//        
//        
//        
//        HStack {
//            VStack{
//                
//                Text("New York City")
//                    .font(.title)
//                
//                Text("September 20-28, 2022")
//                
//                
//            }
//            Button {
//            } label: {
//                Text("Invite Friends")
//                    .font(.title)
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.blue)
//                    .cornerRadius(30)
//            }
//            
//        }
//        
//        
//        
//        Text("Add a New Task to the Checklist")
//        
//        
//        VStack{
//            
//            Text("What")
//            Text("(Example:Purchase plane tickets)")
//            TextField("Enter an activity", text: $textFieldContent)
//                .textContentType(.givenName).border(Color.gray.opacity(0.5))
//            
//            
//        }
//        
//        
//        
//        VStack{
//            
//            Text("When")
//            Text("(August 10 at 11am to 12pm)")
//            DatePicker(selection: $datesave
//                       , label: { Text("Choose Date") })
//            
//        }
//        
//        
//        VStack{
//            
//            Text("Who")
//            TextField("Diana", text: $textFieldContent2)
//                .textContentType(.givenName).border(Color.gray.opacity(0.5))
//            
//            Menu {
//                ForEach(dropDownList, id: \.self){ client in
//                    Button(client) {
//                        self.value = client
//                    }
//                }
//            } label: {
//                VStack(spacing: 5){
//                    HStack{
//                        Text(value.isEmpty ? placeholder : value)
//                            .foregroundColor(value.isEmpty ? .gray : .black)
//                        Spacer()
//                        Image(systemName: "chevron.down")
//                            .foregroundColor(Color.orange)
//                            .font(Font.system(size: 20, weight: .bold))
//                    }
//                    .padding(.horizontal)
//                    Rectangle()
//                        .fill(Color.orange)
//                        .frame(height: 2)
//                }
//            }
//        }
//        
//        var name: String?
//        var details: String?
//        var members: [User]?
//        var dueDate: Date?
//        var done: Bool
//        var day: TripDay?
//        
//        
//    
//        
//        
//        
//        var newOne = Task(name: name, details: textFieldContent, members: trip.members, dueDate: dueDate, done: $done)
//    
//        newTask.addTask(newOne)
//        
//        var newTrip = Trip(id: trip.id, name: trip.name, uniqueCode: trip.uniqueCode, owner: trip.owner, members: trip.members, memberIds: trip.memberIds, destination: trip.destination, from: trip.from, to: trip.to, itinerary: trip.itinerary, proposals: trip.proposals, tasks: trip.tasks)
//        
//        
//        newTrip.updateTask(task: newTask)
//        
//        
//        repo.updateTrip(trip: newTrip)
//        
//        
//        Button {
//  //        let uniqueCode = repo.getUniqueCode()
//            var newTask = Task(name: name, details: textFieldContent, members: trip.members, dueDate: datesave, done: False)
//
//            
//            
//            save or update
//          task.addMember(user: repo.user)
//            
//          repo.updateTrip(trip: trip)
//            
//
//    
//        
//        func addTask{
//        
//    
//        }
//        
//    
//        updates entire trip
//        
//        
//        NavigationLink("Submit", destination: YourChecklistsView(repo: repo, trip: trip)){
//            Button(action: {}){
//                .padding()
//                .background(Color.blue)
//                .cornerRadius(30)
//     
//        }
//    }
//        
//        
//        
//
//
//VStack{
//  ForEach(repo.trips) { trip in
//    NavigationLink(destination: TripView(trip: trip, repo: repo)) {
//      Button(action: {}) {
//        VStack (spacing: 10){
//          Text(trip.name)
//            .font(.headline)
//            .foregroundColor(.white)
//          Text(trip.from ?? Date(), style: .date)
//            .font(.subheadline)
//            .foregroundColor(.white)
//        }//end vstack
//      } //
//        
//        
//        
////
////var newTrip = Trip(name: name, uniqueCode: "", owner: repo.user, destination: destination, from: startDate, to: endDate)
////newTrip.addMember(user: repo.user)
////repo.createTrip(trip: newTrip)
////
////
//
//
//
//
