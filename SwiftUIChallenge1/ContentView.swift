//
//  ContentView.swift
//  SwiftUIChallenge1
//
//  Created by MacBook Pro on 30/05/2021.
//

import SwiftUI

enum TemperatureScale: String, CaseIterable, Identifiable {
    case celcius = "Celcius"
    case farenheit = "Farenheit"
    case kelvin = "Kelvin"

    var id: Self { self }
}

struct ContentView: View {
    
    @State var valueToBeConverted = ""
    @State var temperatueScaleToConvert = TemperatureScale.farenheit
    @State var temperatureScaleConverted = TemperatureScale.farenheit

    var convertedValue : Double {
        return 1
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
//
                    Picker("Choose value", selection: $temperatueScaleToConvert) {
                        ForEach(TemperatureScale.allCases) {
                            Text($0.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Temperature to be converted")) {
                    TextField("Temperature to be converted", text: $valueToBeConverted)
                }
                
                Section {
//
                    Picker("Choose value", selection: $temperatureScaleConverted) {
                        ForEach(TemperatureScale.allCases) {
                            Text($0.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted temperature")) {
                    Text("\(convertedValue, specifier: "%.2f")")
                }
                

                
            }.navigationBarTitle("Temperature Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
