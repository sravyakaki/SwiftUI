//
//  ContentView.swift
//  BetterRest
//
//  Created by Sravya Kaki on 2024-12-12.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
   static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up")
                {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .font(.headline)

                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                .font(.headline)
                Section("Daily coffee intake"){
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                        ForEach(0..<21) { amount in
                            Text("\(amount)")
                        }
                    }
                    .pickerStyle(.menu)
                    
                }
                .font(.headline)
                Section("Your ideal bedtime is..."){
                    if(showAlert){
                        Text(alertMessage)
                    }
                }.font(.largeTitle)
            }
            .navigationTitle("BetterRest")
            .onChange(of: wakeUp) {_,_  in calculateBedtime()}
            .onChange(of: sleepAmount) {_,_ in calculateBedtime()}
            .onChange(of: coffeeAmount) {_,_ in calculateBedtime()}
//            .toolbar {
//                Button("Calculate", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showAlert) {
//                Button("Ok") {}
//            } message: {
//                Text(alertMessage)
//            }
        }
       
    }
        
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60   * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount) )
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there is a problem calculating your bedtime."
        }
        showAlert = true
    }
    
}



#Preview {
    ContentView()
}
