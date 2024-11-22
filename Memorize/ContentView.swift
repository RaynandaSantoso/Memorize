//
//  ContentView.swift
//  Memorize
//
//  Created by Raynanda on 13/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to Bitcoin Mania!")
                .bold()
                .font(.title)
                .multilineTextAlignment(.leading)
                .padding([.top, .trailing])
                .background(.orange)
            }
        }
                
}
    

#Preview {
    ContentView()
}


