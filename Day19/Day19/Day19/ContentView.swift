//
//  ContentView.swift
//  Day19
//
//  Created by Sravya Kaki on 2024-12-03.
//
//
//  ContentView.swift
//
//

import SwiftUI

struct ContentView: View {
    
    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    @State private var inputUnit = "Meters"
    @State private var outputUnit = "Meters"
    @State private var inputValue = ""
    
    let conversionToMeters: [String: Double] = [
        "Meters": 1,
        "Kilometers": 1000,
        "Feet": 0.3048,
        "Yards": 0.9144,
        "Miles": 1609.34
    ]
    
    var result: String {
        
        guard let value = Double(inputValue) else {
            return "No value"
        }
        
        let inputInMeters = value * (conversionToMeters[inputUnit] ?? 1)
        
        let outputValue = inputInMeters / (conversionToMeters[outputUnit] ?? 1)
        
        return String(format: "%.2f", outputValue)
    }
 
    var body: some View {
                Form {
                   Section {
                       Picker("Input Unit", selection: $inputUnit) {
                            ForEach(units, id:\.self) {
                                Text($0)
                                
                            }
                        } .pickerStyle(.segmented)
                       Picker("Output Unit", selection: $outputUnit) {
                            ForEach(units, id:\.self) {
                                Text($0)
                                
                            }
                        } .pickerStyle(.segmented)
                       TextField("Input Number", text: $inputValue)
                           .keyboardType(.decimalPad)
                       Text("Result: \(result)")
 
                    }
                    
                }
  
        }
    }


#Preview {
    ContentView()
}

