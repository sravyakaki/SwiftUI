//
//  ContentView.swift
//  Animations
//
//  Created by Sravya Kaki on 12/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingRed = false
    var body: some View {
        ZStack {
            VStack {
                Button("Tap Me") {
                    withAnimation {
                        isShowingRed.toggle()
                    }
                }
                
                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(AsymmetricTransition(insertion: .scale, removal: .opacity))
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
