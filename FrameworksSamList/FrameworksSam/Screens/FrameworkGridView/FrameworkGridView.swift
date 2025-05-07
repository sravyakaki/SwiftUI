//
//  FrameworkGridView.swift
//  FrameworksSam
//
//  Created by Sravya Kaki on 2025-04-29.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: FrameworkDetailView(framework: framework, showingDetailView: $viewModel.isShowingDetailView)) {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }.accentColor(Color(.label))
    }
}

#Preview {
    FrameworkGridView()
}
