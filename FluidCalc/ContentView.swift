//
//  ContentView.swift
//  FluidCalc
//
//  Created by Tuğçe Saygın on 26.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var girilenBirim =  0.0
    @State private var selectedBirim = "liters"
    @State private var selectedSecondBirim = "liters"
    
    
    let volume = ["ml", "liters", "cups", "pints", "gallons"]
    
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                
                Section{
                  
                    TextField("Birim girin", value : $girilenBirim , format: .number)
                  
                    Picker("", selection: $selectedBirim){
                        ForEach(volume , id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                }
                
                Section("convert to"){
                    
                    Text("")
                    Picker("", selection: $selectedSecondBirim){
                        ForEach(volume , id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
                
                
            }.navigationTitle("FLUID CALC")
        }
    }
}

#Preview {
    ContentView()
}
