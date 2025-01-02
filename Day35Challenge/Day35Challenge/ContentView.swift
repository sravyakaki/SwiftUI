//
//  ContentView.swift
//  Day35Challenge
//
//  Created by Sravya Kaki on 12/27/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTable: Int = 4
    @State var numberOfQuestions: Int = 2
    @State var startGame: Bool = false
    @State var questions: [Question] = []
    @State var currentQuestionIndex: Int = 0
    @State var userAnswer: String = ""
    @State var score: Int = 0
    @State var showAlert: Bool = false
    @State private var rotationAngle = 0.0
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple,.pink,.green,.cyan], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Let's play the multiplication game")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Section("Choose your table")
                {
                    Stepper("Up to: \(selectedTable)", value: $selectedTable, in: 2...12)
                        .onChange(of: selectedTable) {
                            restartGame()
                        }
                }
                .foregroundStyle(.white)
                .fontWeight(.bold)
                Section("Choose the number of questions")
                {
                    Picker("Questions",selection: $numberOfQuestions) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        Text("10").tag(10)
                    }
                    .foregroundStyle(.white)
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .onChange(of: numberOfQuestions) {
                        restartGame()
                    }
                }
                .foregroundStyle(.white)
                .fontWeight(.bold)
                if  !startGame {
                    Button("Start Game") {
                        generateQAndA()
                    }
                    .frame(width: 200, height: 50)
                    .background(.yellow)
                    .foregroundStyle(.black)
                    .cornerRadius(10)
                }
                if  startGame {
                    VStack(spacing: 20) {
                        Text("Question \(currentQuestionIndex + 1) of \(questions.count)")
                        Text(questions[currentQuestionIndex].question)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        TextField("Enter your answer", text: $userAnswer)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .padding()
                        Button("Submit Answer") {
                            checkAnswer()
                        }
                        .frame(width: 200, height: 50)
                        .background(.red)
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                }
                .padding()
                }
            }
            .padding()
            
        }
        .alert("Game Over", isPresented: $showAlert) {
            Button("Restart Game") {
                startGame = true
                score = 0
                showAlert = false
                generateQAndA()
            }
            Button("OK") {
                startGame = false
                score = 0
                showAlert = false
            }
        } message: {
            Text("Your score is: \(score) out of \(questions.count)")
        }
       
        
    }
    
    func generateQAndA() {
        questions = (1...numberOfQuestions).map { _ in
            let multiplier = Int.random(in: 1...selectedTable)
            let multiplicand = Int.random(in: 1...12) // In 3 table, multiplicand is 3 and multiplier could be 1,2,3 ...12 etc.,
             
            return Question(question: "What does \(multiplicand) x \(multiplier) produce?", answer: multiplicand * multiplier)
        }
        currentQuestionIndex = 0
        startGame = true
    }
    
    func checkAnswer() {
        guard let userEnteredAnswer = Int(userAnswer) else {
            return
        }
        if userEnteredAnswer == questions[currentQuestionIndex].answer {
            score += 1
        }
        userAnswer = ""
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            showAlert = true
            startGame = false
        }
    }
    
    func restartGame() {
        score = 0
        userAnswer = ""
        generateQAndA()
    }
}


struct Question {
    let question: String
    let answer: Int
}



//Alternate Solution
/*
 struct ContentView: View {
     @State private var isGameActive = false
     @State private var selectedTable = 5
     @State private var numberOfQuestions = 5
     @State private var questions: [Question] = []
     @State private var currentQuestionIndex = 0
     @State private var score = 0

     var body: some View {
         NavigationView {
             if isGameActive {
                 GameView(
                     questions: $questions,
                     currentQuestionIndex: $currentQuestionIndex,
                     score: $score,
                     isGameActive: $isGameActive
                 )
             } else {
                 SettingsView(
                     selectedTable: $selectedTable,
                     numberOfQuestions: $numberOfQuestions,
                     startGame: startGame
                 )
             }
         }
     }

     func startGame() {
         questions = (1...numberOfQuestions).map { _ in
             let multiplier = Int.random(in: 1...selectedTable)
             let multiplicand = Int.random(in: 1...12)
             return Question(
                 text: "What is \(multiplier) x \(multiplicand)?",
                 answer: multiplier * multiplicand
             )
         }
         currentQuestionIndex = 0
         score = 0
         isGameActive = true
     }
 }

 // MARK: - Question Struct
 struct Question {
     let text: String
     let answer: Int
 }

 // MARK: - SettingsView
 struct SettingsView: View {
     @Binding var selectedTable: Int
     @Binding var numberOfQuestions: Int
     var startGame: () -> Void

     var body: some View {
         Form {
             Section(header: Text("Select Multiplication Table")) {
                 Stepper("Up to \(selectedTable)", value: $selectedTable, in: 2...12)
             }

             Section(header: Text("Number of Questions")) {
                 Picker("Questions", selection: $numberOfQuestions) {
                     Text("5").tag(5)
                     Text("10").tag(10)
                     Text("20").tag(20)
                 }
                 .pickerStyle(SegmentedPickerStyle())
             }

             Button(action: startGame) {
                 Text("Start Game")
                     .frame(maxWidth: .infinity)
                     .padding()
                     .background(Color.blue)
                     .foregroundColor(.white)
                     .cornerRadius(10)
             }
         }
         .navigationTitle("Settings")
     }
 }

 // MARK: - GameView
 struct GameView: View {
     @Binding var questions: [Question]
     @Binding var currentQuestionIndex: Int
     @Binding var score: Int
     @Binding var isGameActive: Bool
     @State private var userAnswer = ""
     @State private var showAlert = false

     var body: some View {
         VStack(spacing: 20) {
             Text("Question \(currentQuestionIndex + 1) of \(questions.count)")
                 .font(.headline)

             Text(questions[currentQuestionIndex].text)
                 .font(.largeTitle)
                 .fontWeight(.bold)

             TextField("Enter your answer", text: $userAnswer)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .keyboardType(.numberPad)
                 .padding()

             Button(action: submitAnswer) {
                 Text("Submit")
                     .frame(maxWidth: .infinity)
                     .padding()
                     .background(Color.green)
                     .foregroundColor(.white)
                     .cornerRadius(10)
             }

             Spacer()
         }
         .padding()
         .navigationTitle("Game")
         .alert(isPresented: $showAlert) {
             Alert(
                 title: Text("Game Over"),
                 message: Text("Your score: \(score) out of \(questions.count)"),
                 dismissButton: .default(Text("Play Again")) {
                     isGameActive = false
                 }
             )
         }
     }

     func submitAnswer() {
         guard let userAnswerInt = Int(userAnswer) else { return }
         if userAnswerInt == questions[currentQuestionIndex].answer {
             score += 1
         }

         userAnswer = ""

         if currentQuestionIndex < questions.count - 1 {
             currentQuestionIndex += 1
         } else {
             showAlert = true
         }
     }
 }
 */

