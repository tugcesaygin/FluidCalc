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
    @State private var selectedSecondBirim = "ml"
    @State private var outBirim = 0.0
    
    let volume = ["ml", "liters", "cups", "pints", "gallons"]
    

    var mLHesapla : Double{
        
        var girilmisVeri = 0.0
       
        if selectedBirim == volume[0]{
            girilmisVeri = girilenBirim
        }else if selectedBirim == volume[1]{
            girilmisVeri = girilenBirim / 1000
        
        }else if selectedBirim == volume[2]{
            girilmisVeri = girilenBirim / 200
            
        }else if selectedBirim == volume[3]{
            girilmisVeri = girilenBirim / 568
            
        }else if selectedBirim == volume[4]{
            girilmisVeri = girilenBirim / 3785.411784
            
        }
        return girilmisVeri
        
    }
    
    

    
    
   
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
                    
                    Text("\(mLHesapla) ml")

                    
                }
                
                
                
                Section("convert to"){
                    
                    
                    Picker("", selection: $selectedSecondBirim){
                        ForEach(volume , id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    Text("")
                    
                }
                
                
                
            }.navigationTitle("FLUID CALC")
        }
    }
}

#Preview {
    ContentView()
}
