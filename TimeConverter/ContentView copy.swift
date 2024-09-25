//
//  ContentView.swift
//  TimeConverter
//
//  Created by sandy zheng on 9/25/24.
// Time conversion: users choose seconds, minutes, hours, or days.


import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var inputUnit = "seconds"
    @State private var outputUnit = "seconds"
    let Units = ["seconds", "minutes", "hours", "days"]
    var outputNumber: Double {
        let inputInSeconds: Double
        
        if (inputUnit == "days"){
            inputInSeconds = inputNumber * 86400
        }
        else if (inputUnit == "hours"){
            inputInSeconds = inputNumber * 3600
        }
        else if (inputUnit == "minutes"){
            inputInSeconds = inputNumber * 60
        }
        else {
            inputInSeconds = inputNumber
        }
        
        
        if (outputUnit == "days"){
            return inputInSeconds / 86400
        }
        else if (outputUnit == "hours"){
            return inputInSeconds / 3600
        }
        else if (outputUnit == "minutes"){
            return inputInSeconds / 60
        }
        return inputInSeconds
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Section("What's your input Number?"){
                        TextField("What's your input number", value: $inputNumber, format: .number.precision(.fractionLength(2)))
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    
                    Section("What's your input unit"){
                        Picker("input unit: ", selection: $inputUnit) {
                            ForEach(Units, id:\.self){
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }
                    
                    Section("What's your output unit"){
                        Picker("output unit: ", selection: $outputUnit) {
                            ForEach(Units, id:\.self){
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }
                    
                    Section("Converted Number"){
                        Text(outputNumber, format: .number.precision(.fractionLength(2)))
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding()
                    }
                    
                }
                .navigationTitle("TimeConverter")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    HStack {
                                        Image(systemName: "clock.fill")
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                        Text("TimeConverter")
                                            .font(.headline)
                                    }
                                }
                            }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
