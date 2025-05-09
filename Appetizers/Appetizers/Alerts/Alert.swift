//
//  Alert.swift
//  Appetizers
//
//  Created by Sravya Kaki on 2025-05-08.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK :- Network Alerts
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                              message: Text("The data received from the server was indalid. Please contact support."),
                                              dismissButton: .default(Text("Ok")))
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server please try again or contact support"),
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("There was an issue connecting to the server. Please try again later"),
                                              dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete this reqtuest. Please check your internet connection and try again later"),
                                              dismissButton: .default(Text("Ok")))
    
    //MARK :- Account Alerts
    
    static let invalidForm      = AlertItem(title: Text("Invalid Form"),
                                              message: Text("Please ensure all fields have been filled out"),
                                              dismissButton: .default(Text("Ok")))
    static let invalidEmail     = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please ensure your email is correct"),
                                              dismissButton: .default(Text("Ok")))
    static let userSaveSuccess  = AlertItem(title: Text("Profile saved"),
                                            message: Text("Your profile information was succesfully saved"),
                                              dismissButton: .default(Text("Ok")))
    static let invalidUserData  = AlertItem(title: Text("Profile error"),
                                            message: Text("There was an error saving/retrieving your profile data"),
                                              dismissButton: .default(Text("Ok")))
    
}
