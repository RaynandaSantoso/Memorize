//
//  ContentView.swift
//  Memorize
//
//  Created by Raynanda on 13/11/24.
// 

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "₿", "🎃", "🥶", "🤖", "😱", "🤡", "💀", "😴", "😈"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            adjustCards
            
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) {index in
                cardView(content: emojis[index])
            }
            .foregroundColor(.orange)
        }
    }
    
    var adjustCards: some View {
        HStack {
            removeButton
            Spacer()
            addButton
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
            
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var removeButton: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var addButton: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
}



    
#Preview {
    ContentView()
}


struct cardView: View {
    @State var isFaceUp = false
    
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else {
                base.fill()
            }
            
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}
