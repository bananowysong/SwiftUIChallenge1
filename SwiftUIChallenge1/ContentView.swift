//
//  ContentView.swift
//  SwiftUIChallenge1
//
//  Created by MacBook Pro on 30/05/2021.
//

import SwiftUI

enum TemperatureScale: String, CaseIterable {
    case celcius = "Celcius"
    case farenheit = "Farenheit"
    case kelvin = "Kelvin"
}

struct ContentView: View {
    
    let temperatureScales = TemperatureScale.allCases
    @State var valueToBeConverted = ""
    @State var temperatueScaleToConvert = 1
    @State var temperatureScaleConverted = 1

    var convertedValue : Double {
        return 1
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
//
                    Picker("Choose value", selection: $temperatueScaleToConvert) {
                        ForEach(0 ..< temperatureScales.count) {
                            Text(temperatureScales[$0].rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Value to be converted")) {
                    TextField("Value to be converted", text: $valueToBeConverted)
                }
                
                Section {
//
                    Picker("Choose value", selection: $temperatureScaleConverted) {
                        ForEach(0 ..< temperatureScales.count) {
                            Text(temperatureScales[$0].rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted value")) {
                    Text("\(convertedValue, specifier: "%.2f")")
                }
                

                
            }.navigationBarTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
