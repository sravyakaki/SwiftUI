//
//  Appetizer.swift
//  Appetizers
//
//  Created by Sravya Kaki on 2025-05-08.
//

import Foundation
struct Appetizer: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}


struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizers 1",
                                           description: "This is a description for our appetizer",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 0001,
                                           name: "Test Appetizers 1",
                                           description: "This is a description for our appetizer",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)

    static let orderItemTwo = Appetizer(id: 0002,
                                           name: "Test Appetizers 2",
                                           description: "This is a description for our appetizer",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    static let orderItemThree = Appetizer(id: 0003,
                                           name: "Test Appetizers 3 ",
                                           description: "This is a description for our appetizer",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    static let orderItemFour = Appetizer(id: 0004,
                                           name: "Test Appetizers 4",
                                           description: "This is a description for our appetizer",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree, orderItemFour]
}
