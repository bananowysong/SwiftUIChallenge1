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
    
    @State var temperatureToBeConverted = ""
    @State var temperatueScaleToConvert = TemperatureScale.farenheit
    @State var temperatureScaleConverted = TemperatureScale.farenheit

    var convertedTemperature : Double {
        
        let toBeConverted = Double(temperatureToBeConverted) ?? 0
        
        
        switch (temperatueScaleToConvert, temperatureScaleConverted) {
        case(TemperatureScale.celcius,TemperatureScale.kelvin): return toBeConverted + 273.15
        case(TemperatureScale.celcius,TemperatureScale.farenheit): return (toBeConverted * 9/5) + 32
        case(TemperatureScale.kelvin,TemperatureScale.celcius): return toBeConverted - 273.15
        case(TemperatureScale.kelvin,TemperatureScale.farenheit): return (toBeConverted - 273.15) * 9/5 + 32
        case(TemperatureScale.farenheit,TemperatureScale.celcius): return (toBeConverted - 32) * 5/9
        case(TemperatureScale.farenheit,TemperatureScale.kelvin): return (toBeConverted - 32) * 5/9 + 273.15
        default: return toBeConverted
        }
       
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
                    TextField("Temperature to be converted", text: $temperatureToBeConverted)
                        .keyboardType(.decimalPad)
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
                    Text("\(convertedTemperature, specifier: "%.2f")")
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
