//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Sravya Kaki on 2025-05-09.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)

            Image(systemName: "xmark")
                .frame(width: 44, height: 44)
                .imageScale(.small)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    XDismissButton()
}
