//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Sravya Kaki on 2024-12-06.
//

import SwiftUI

struct ContentView: View {
    @State private var val = false
    
    var body: some View {
        VStack {
            Button("Hello World") {
                val.toggle()
            }
            .someStyle()        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CustomView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func someStyle() -> some View {
        modifier(CustomView())
    }
}
