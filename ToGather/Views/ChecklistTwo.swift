//
//  ChecklistTwo.swift
//  ToGather
//
//  Created by Yi  on 11/6/22.
//


import Foundation

import SwiftUI




//MARK:- Radio Button Field

struct Task2: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool

}



struct ChecklistTwo: View {


    var repo: UserRepository
    var trip: Trip



//
//
//    let newProposal = Proposal(newEvent: Event(name: name, category: category, location: location, from: startDate, to: endDate, detail: detail, link: link), proposer: repo.user)
//    var newTrip = Trip(id: trip.id, name: trip.name, uniqueCode: trip.uniqueCode, owner: trip.owner, members: trip.members, destination: trip.destination, from: trip.from, to: trip.to, itinerary: trip.itinerary, proposals: trip.proposals, tasks: trip.tasks)
//
//    newTrip.addProposal(proposal: newProposal)
//    repo.updateTrip(trip: newTrip)
//    repo.load()


//    @State private var tasks = [Task2(name: "Purchase plane tickets to NYC by you, as of September 1", isCompleted: false), Task2(name:"Reserve Freeman Hotel by Diana, as of August 1", isCompleted: false), Task2(name:"Purchase plane ticketes by Brandon, as of August 1 ", isCompleted: false), Task2(name:"Reserve Freeman Hotel by Diana, as of August 11", isCompleted: false), Task2(name:"Reserve Cote by Diana, as of August 21", isCompleted: false)]




    @State private var checked = true

    var body: some View {
        HStack {
            VStack{

                Text("New York City")
                    .font(.title)

                Text("September 20-28, 2022")


                // task User
            }
            Button {
            } label: {
                Text("Invite")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(30)
            }

        }

        Text("Checklist")

//
//        VStack{
//            List(trip.tasks){ task in
//                ChecklistTwoRowView(task: task)
//            }
//        }


        NavigationLink("+Add a New Task", destination: ChecklistThree())
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(30)



        HStack{
            Text("Car")
            Image(systemName: "􀽜")
            Text("Checklist")
            Image(systemName: "􁙕")
        }



    }

}

