//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Sravya Kaki on 6/3/21.
//

import SwiftUI

struct ChallengeView: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        content
                .font(.title)
                .foregroundColor(.blue)
    }
}

extension View {
    func testThisCV(with text: String) -> some View {
        self.modifier(ChallengeView(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hey there")
            .testThisCV(with: "It's time to test")
        
    }
}

