//
//  ContentView.swift
//  GuessTheApp
//
//  Created by Sravya Kaki on 5/21/21.
//

import SwiftUI

struct FlagImageView: View {
    var flagName: String
    
    var body: some View {
        Image(flagName)
    .renderingMode(.original)
    .clipShape(Capsule())
    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
    .shadow(color: .black, radius: 2)
    }
}



struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        VStack(spacing: 30) {
        VStack {
            Text("Tap the flag of").foregroundColor(.white)
                
            Text(countries[correctAnswer]).foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
            
        }
        ForEach(0..<3) { number in
            Button(action: {
                    self.flagTapped(number)            })
            {
 
            FlagImageView(flagName: self.countries[number])
                                }
        }
            Text("User Score: \(userScore)").foregroundColor(.white)
        Spacer()
    }
        }.alert(isPresented: $showingScore) {
            if scoreTitle == "Correct" {
            return Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
            }
            else {
            return Alert(title: Text(scoreTitle), message: Text("That's the flag of \(countries[correctAnswer]). Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Create a 3 x 3 Grid
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Spacer()
//            HStack {
//                Text("Hello")
//                Text("Hello")
//                Text("Hello")
//            }
//            Spacer()
//            HStack {
//                Text("Hello")
//                Text("Hello")
//                Text("Hello")
//            }
//            Spacer()
//            HStack {
//                Text("Hello")
//                Text("Hello")
//                Text("Hello")
//            }
//            Spacer()
//        }
//    }
//}
