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
            cardView()
            cardView()
            cardView()
            cardView()
        }.foregroundColor(.orange)
        
    }
}
    

#Preview {
    ContentView()
}


struct cardView: View {
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🤫").font(.largeTitle)
            }
            else {
                base.fill()
            }
            
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}
