//
//  ContentView.swift
//  LoginSampleAppSwiftUI
//
//  Created by Sravya Kaki on 1/7/21.
//  Copyright © 2021 Sravya Kaki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    let verticalPaddingForForm = 20.0
    var body: some View {
        VStack(spacing: CGFloat(verticalPaddingForForm)) {
            Text("Welcome to our cool App!").foregroundColor(Color.black)
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.secondary)
                TextField("Username", text: $username)
                    .foregroundColor(Color.black)
            }
            .padding()
            .background(Color(UIColor.lightGray))
            .cornerRadius(10)
            HStack {
                Image("icons8-key-50")
                .resizable()
                .frame(width: 16.0, height: 16.0)
                .foregroundColor(.secondary)
                SecureField("Password", text: $password)
                    .foregroundColor(Color.black)
            }
            .padding()
            .background(Color(UIColor.lightGray))
            .cornerRadius(10)
            Button(action: {}) {
                Text("Login")
                    .padding()
            }.foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
            
        }.padding(.horizontal, CGFloat(verticalPaddingForForm))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



