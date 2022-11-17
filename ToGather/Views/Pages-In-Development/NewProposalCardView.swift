//
//  NewProposalCardView.swift
//  ToGather
//
//  Created by Lisa Leung on 11/17/22.
//

//MARK: made with Paul Hudson's single card view example https://www.hackingwithswift.com/books/ios-swiftui/designing-a-single-card-view

//MARK: experimenting with hiding field values and the replies for trip plan/proposals
import SwiftUI
struct NewProposalCardView: View {
    @State private var isShowingAnswer = false

    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)

            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)

                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 250)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

struct NewProposalCardView_Previews: PreviewProvider {
  static var previews: some View {
    NewProposalCardView(card: Card.example)
  }
}
