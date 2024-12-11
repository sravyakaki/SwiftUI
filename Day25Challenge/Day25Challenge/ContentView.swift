//
//  ContentView.swift
//  Day25Challenge
//
//  Created by Sravya Kaki on 2024-12-08.
//

import SwiftUI

struct ContentView: View {
    @State private var userChoice = ""
    @State private var availableChoices = ["🪨 rock", "📄 paper", "✂️ scissors"].shuffled()
    @State private var appChoice = Int.random(in: 0...2)
    @State private var winningChoice = Bool.random()
    @State private var currentScore = 0
    @State private var isGameOver = false
    @State private var numOfQuestions = 0
    
    func choiceMade(_ currentChoice: String, _ userChoice: String) {
        if(numOfQuestions < 10)
        {
            if(winningChoice) {
               let rightChoice = winningAnswer(currentChoice)
                currentScore = (rightChoice == userChoice) ? currentScore+1 : currentScore-1
            } else {
              let rightChoice =  losingAnswer(currentChoice)
              currentScore = (rightChoice == userChoice) ? currentScore+1 : currentScore-1

            }
            numOfQuestions += 1
            winningChoice = Bool.random()
            appChoice = Int.random(in: 0...2)
        } else {
            isGameOver = true
        }
    }
    
    func askQuestion() {
        currentScore = 0
        numOfQuestions = 0
        winningChoice = Bool.random()
        appChoice = Int.random(in: 0...2)
    }
    
    func winningAnswer(_ choice: String) -> String {
        switch(choice) {
        case "🪨 rock":
            return "📄 paper"
        case "📄 paper":
            return "✂️ scissors"
        case "✂️ scissors":
            return "🪨 rock"
        default:
            return "Option Unavailable"
        }
    }
    
    func losingAnswer(_ choice: String) -> String {
        switch(choice) {
        case "🪨 rock":
            return "✂️ scissors"
        case "📄 paper":
            return "🪨 rock"
        case "✂️ scissors":
            return "📄 paper"
        default:
            return "Option Unavailable"
        }
    }
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [.init(color: .pink, location: 0.3), .init(color: .green, location: 0.3),], center: .top, startRadius: 100, endRadius: 700).ignoresSafeArea()
            VStack(spacing: 15){
                Text("App's choice is:")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.black)
                Text(availableChoices[appChoice])
                    .font(.largeTitle.bold())
                    .foregroundStyle(.black)
                
                Text("Make a \(winningChoice ? "winning" : "losing") choice")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.black)
                VStack (spacing: 15){
                    Text("Your current score is \(currentScore)")
                    ForEach(0..<3) { number in
                        Button(availableChoices[number]) {
                            userChoice = availableChoices[number]
                            choiceMade(availableChoices[appChoice], userChoice)
                        }
                        
                    }
                    .font(.largeTitle.bold())
                    .foregroundStyle(.black)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
            }.padding()
        }
        .alert("Game Over", isPresented: $isGameOver) {
            Button("Start Over", action: askQuestion)
        } message: {
            Text("Click start over to begin a new game")
        }
        
    }
}

#Preview {
    ContentView()
}
