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
    
    var body: some View {
        NavigationView {
            Form {
                
                
                Section(header: Text("Value to be converted")) {
                    TextField("Value to be converted", text: $valueToBeConverted)
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
