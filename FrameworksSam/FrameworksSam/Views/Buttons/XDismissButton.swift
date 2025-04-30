//
//  XDismissButton.swift
//  FrameworksSam
//
//  Created by Sravya Kaki on 2025-04-30.
//

import SwiftUI

struct XDismissButton: View {
    @Binding var isShowingModal: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                isShowingModal = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()    }
}

#Preview {
    XDismissButton(isShowingModal: .constant(false))
}
