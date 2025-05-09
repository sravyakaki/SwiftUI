//
//  APButton.swift
//  Appetizers
//
//  Created by Sravya Kaki on 2025-05-09.
//

import SwiftUI

struct APButton: View {

    let title: LocalizedStringKey
    var body: some View {

        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)

    }
}

#Preview {
    APButton(title: "Test")
}
