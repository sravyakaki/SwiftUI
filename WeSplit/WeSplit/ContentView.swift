//
//  ContentView.swift
//  WeSplit
//
//  Created by Sravya Kaki on 3/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 4
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double? {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = tipValue + orderAmount
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var totalAmout: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipPercentage = Double(tipPercentages[tipPercentage])
        
        let tipValue = orderAmount / 100 * tipPercentage
        let totalValue = orderAmount + tipValue
        
        return totalValue
    }
    
    var body: some View {
        NavigationView {
        Form {
            Section {
                TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                TextField("Number of People", value: $numberOfPeople, formatter: NumberFormatter()).keyboardType(.decimalPad)
            }
            Section(header: Text("How much tip do you want to leave?")){                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }.textCase(nil)
            Section(header: Text("Total Amount")) {
                
                Text("$\(totalAmout, specifier: "%.2f")")
                    .foregroundColor(tipPercentage == 4 ? Color.red : Color.black)
            }.textCase(nil)
            
            
            Section(header: Text("Amount Per Person")) {
                Text("$\(totalPerPerson ?? 0, specifier: "%.2f")")
            }.textCase(nil)
        }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
