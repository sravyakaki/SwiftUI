//
//  FrameworkDetailView.swift
//  FrameworksSam
//
//  Created by Sravya Kaki on 2025-04-29.
//

import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    @Binding var showingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack() {
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
       
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
//                AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.red)
            
            
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "https://www.google.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, showingDetailView: .constant(false))
}
