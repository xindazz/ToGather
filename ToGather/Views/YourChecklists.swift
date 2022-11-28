////
////  YourChecklists.swift
////  ToGather
////
////  Created by Lisa Leung on 11/9/22.
////
//
//
//import Foundation
//
//import SwiftUI
//
//
//
//struct YourChecklistsView: View {
//    
//    var repo: UserRepository
//    var trip: Trip
//    
//    
//    
////
////    var newTrip = Trip(id: self.trip.id, name: self.trip.name, uniqueCode: self.trip.uniqueCode, owner: self.trip.owner, members: self.trip.members, memberIds: self.trip.memberIds, destination: self.trip.destination, from: self.trip.from, to: self.trip.to, itinerary: self.trip.itinerary, proposals: self.trip.proposals, tasks: self.trip.tasks)
//    
//
//    
//    @State private var done = false
//    
//    @State private var checked = true
//    
//    @State private var ListDones = []
//    
//    
//
//    var body: some View {
//        
//        
//        
//        //        VStack {
//        HStack {
//            
//            VStack{
//                
//                Text(trip.name)
//                    .font(.title)
//                
//                //                    Text(trip.from)
//                //                    Text(trip.to)
//            }
//            
//            
//            
//            Button {
//            } label: {
//                Text("Invite")
//                    .font(.title)
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.blue)
//                    .cornerRadius(30)
//            }
//            
//            
////                    VStack{
////                        List($tasks){ $task in
////                            HStack{
////                                Image(systemName: task.isCompleted ? "checkmark.square": "square")
////
////                                    .onTapGesture{
////                                        task.isCompleted.toggle()
////
////                                    }
////                                Text(task.name)
////                            }
////                        }
////                    }
////
//            
//            
//            
//            var newTrip = Trip(id: self.trip.id, name: self.trip.name, uniqueCode: self.trip.uniqueCode, owner: self.trip.owner, members: self.trip.members, memberIds: self.trip.memberIds, destination: self.trip.destination, from: self.trip.from, to: self.trip.to, itinerary: self.trip.itinerary, proposals: self.trip.proposals, tasks: self.trip.tasks)
//        
//            
//    
//            VStack{
//            
//            
//                List(trip.tasks){ task in
//                    HStack{
//                        Image(systemName: task.done ? "checkmark.square": "square")
//                        
//                            .onTapGesture{
//                                task.done.toggle()
//                                
//                            }
//                        Text(task.name)
//                 
//                    }
//                }
//                
//            }
//            
//        }
//    }
//}
//
//
//
////    }
//            
//            //            for i in range (len(trip.tasks)){
//            
//    
//            //
//            //
//            //            }
//            //
//            //
//            //
//            //
//            //
//            //
//            //            for i in range
//            //
//            //            var newOne = Task(name: name, details: textFieldContent, members: trip.members, dueDate: dueDate, done: $done)
//            //
//            //            newTask.addTask(newOne)
//            //
//            //            var newTrip = Trip(id: trip.id, name: trip.name, uniqueCode: trip.uniqueCode, owner: trip.owner, members: trip.members, memberIds: trip.memberIds, destination: trip.destination, from: trip.from, to: trip.to, itinerary: trip.itinerary, proposals: trip.proposals, tasks: trip.tasks)
//            //
//            //
//            //            newTrip.updateTask(task: newTask)
//            //
//            //
//            //
//            
//            
//            //
//            //
//            //            repo.updateTrip(trip: newTrip)
//            //
//            
//            
//            
//            //create a new trip w updated done value for checklist
//            
//            
//            
//            
//            
//            //                        VStack{
//            //                            List($tasks){ $task in
//            //                                HStack{
//            //                                    Image(systemName: task.isCompleted ? "checkmark.square": "square")
//            //
//            //                                        .onTapGesture{
//            //                                            task.isCompleted.toggle()
//            //
//            //                                        }
//            //                                    Text(task.name)
//            //                                }
//            //                            }
//            //                        }
//            //
//            
//            
//            
//            
//            
//            //
//            //            NavigationLink("+Add a New Task", destination: ChecklistOne(repo: repo, trip: trip))
//            //                .font(.title)
//            //                .padding()
//            //                .foregroundColor(.white)
//            //                .background(Color.blue)
//            //                .cornerRadius(30)
//            //
//            //
//            
//            
//            
//        
//
//
//
//
