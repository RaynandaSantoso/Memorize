//
//  ContentView.swift
//  Memorize
//
//  Created by Raynanda on 13/11/24.
// 

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            let emojis: Array<String> = ["🤫", "₿", "🙂", "🥶"]
            
            ForEach(emojis.indices, id: \.self) {index in
                cardView(content: emojis[index])
            }
            
        }.foregroundColor(.orange)
        
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
