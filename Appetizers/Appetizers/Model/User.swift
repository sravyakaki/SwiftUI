//
//  User.swift
//  Appetizers
//
//  Created by Sravya Kaki on 2025-05-09.
//

import Foundation

struct User: Codable {
    var firstName        = ""
    var lastName         = ""
    var email            = ""
    var birthDate        = Date()
    var extraNapkins     = false
    var frequestRefills  = false
}
