//
//  ContentView.swift
//  Challenge1Day19
//
//  Created by Sravya Kaki on 5/15/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = 0
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let inputUnitArr = ["Meters", "Kilometers", "Feet", "Yard", "Miles"]
    let outputUnitArr = ["Meters", "Kilometers", "Feet", "Yard", "Miles"]
    
    var outputValue: Double {
      let input = Double(inputValue)
      var output: Double
            switch inputUnit {
            case 0:
               output = input * 3.28
                return output
            case 1:
                output = input * 3280.84
                return output
            case 2:
                return input
            case 3:
                output = input * 3
                return output
            case 4:
                output = input * 5280
                return output
            default:
                return 0
            }
    }
    
    var selectedOutputUnit: Double {
        var finalOutput: Double
        switch outputUnit {
        case 0:
            finalOutput = outputValue * 0.3048
            return finalOutput
        case 1:
            finalOutput = outputValue * 0.00030
            return finalOutput
        case 2:
            finalOutput = outputValue
            return finalOutput
        case 3:
            finalOutput = outputValue * 0.3333
            return finalOutput
        case 4:
            finalOutput = outputValue * 0.000189
            return finalOutput
        default:
            return 0
        }
    }
    
    
    var body: some View {
        Form {
            Section(header: Text("Input Value")){
                TextField("Enter value to convert", value: $inputValue, formatter: NumberFormatter()).keyboardType(.decimalPad)
                Picker("Length Conversion Metric", selection: $inputUnit) {
                    ForEach(0..<inputUnitArr.count) {
                        Text("\(self.inputUnitArr[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }.textCase(nil)
            Section(header: Text("Output Value")){
                Picker("Choose Output Metric", selection: $outputUnit){
                    ForEach(0..<outputUnitArr.count){
                        Text("\(self.outputUnitArr[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                Text("\(selectedOutputUnit, specifier: "%.5f")")
            }.textCase(nil)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
