//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Sravya Kaki on 2025-05-08.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
