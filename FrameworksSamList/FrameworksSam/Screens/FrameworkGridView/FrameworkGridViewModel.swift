//
//  FrameworkGridViewModel.swift
//  FrameworksSam
//
//  Created by Sravya Kaki on 2025-04-29.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
   @Published var isShowingDetailView = false
}
