//
//  ContentView.swift
//  Memorize
//
//  Created by Raynanda on 13/11/24.
// 

import SwiftUI

struct ContentView: View {
    let halloweenEmojis: [String] = ["👻", "₿", "🎃", "🥶", "🤖", "😱", "🤡", "💀", "😴", "😈","👻", "₿", "🎃", "🥶", "🤖", "😱", "🤡", "💀", "😴", "😈"]
    let animalEmojis: [String] = ["😺", "🐞", "🐧", "🐷", "🐨", "🦁", "🐯", "🐻","😺", "🐞", "🐧", "🐷", "🐨", "🦁", "🐯", "🐻"]
    let foodEmojis: [String] = ["🍓", "🍑", "🥕", "🍊","🍓", "🍑", "🥕", "🍊"]
    
    @State var selectedEmojis: [String] = []
    
    var body: some View {
        VStack {
            Text("MEMORIZE!")
                .font(.largeTitle)

            cards
            themeSelector
        }
        .padding()
    }
    
    
    var cards: some View {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
                ForEach(0..<selectedEmojis.count, id: \.self) {index in
                    cardView(content: selectedEmojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
                .foregroundColor(.orange)
        }
    }

    func cardThemeSelector(emoji: [String], sysName: String, text: String) -> some View {
        Button(action: {
            selectedEmojis = emoji.shuffled()
        }, label: {
            VStack {
                Image(systemName: sysName)
                    .font(.system(size: 30))
                Text(text)
            } .imageScale(.large)
        })
    }
    
    var themeSelector: some View {
        HStack{
            halloweenButton
            Spacer()
            animalButton
            Spacer()
            foodButton
        }.padding()
            .imageScale(.large)
    }
    
    var halloweenButton: some View {
        cardThemeSelector(emoji: halloweenEmojis, sysName: "eye.circle.fill", text: "Halloween")
    }
    var animalButton: some View {
        cardThemeSelector(emoji: animalEmojis, sysName: "dog.circle.fill", text: "Animals")
    }
    
    var foodButton: some View {
        cardThemeSelector(emoji: foodEmojis, sysName: "takeoutbag.and.cup.and.straw.fill", text: "Foods")
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
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}
