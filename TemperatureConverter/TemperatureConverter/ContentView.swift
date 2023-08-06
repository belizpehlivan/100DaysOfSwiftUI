//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Beliz on 31.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var input = 0.0
    @State private var input2 = 0.0
    @State private var inputUnit = "Celcius"
    @State private var outputUnit = "Celcius"
    @FocusState private var inputIsFocused: Bool
    
    let units = ["Celcius", "Fahrenheit", "Kelvin"]
    
    var result: String {
        
        var celciusValue = 0.0
        var resultValue = 0.0
        
        switch inputUnit {
            case "Celcius":
                celciusValue = input
            case "Fahrenheit":
                celciusValue = (input - 32) * (5 / 9)
            case "Kelvin":
                celciusValue = input - 273.15
            default:
                celciusValue = 0.0
        }
        
        switch outputUnit {
            case "Celcius":
                resultValue = celciusValue
            case "Fahrenheit":
                resultValue = celciusValue * (9 / 5) + 32
            case "Kelvin":
                resultValue = celciusValue + 273.15
            default:
                resultValue = 0.0
        }
        
        return "\(resultValue.formatted()) °\(outputUnit.first!)"
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the temperature", value: $input, format: .number)
                } header: {
                    Text("Enter the temperature")
                }
                .keyboardType(.decimalPad)
                .focused($inputIsFocused)
                
                
                Section {
                    Picker("From", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("press", value: $input2, format: .number)
                } header: {
                    Text("From")
                }
                
                Section {
                    Picker("To", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
                }
                
                Section {
                    Text("\(result)")
                } header: {
                    Text("Converted Temperature")
                }
                
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
