//
//  ContentView.swift
//  FluidCalc
//
//  Created by Tuğçe Saygın on 26.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var girilenBirim =  0.0
    @State private var selectedBirim = "ml"
    @State private var selectedSecondBirim = "ml"
    
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
    
    var donustur : Double {
       
        var sonVeri = 0.0
    
        
        if selectedSecondBirim == volume[0]{
            sonVeri = mLHesapla
        }else if selectedSecondBirim == volume[1]{
            sonVeri = mLHesapla / 1000
        
        }else if selectedSecondBirim == volume[2]{
            sonVeri = mLHesapla / 200
            
        }else if selectedSecondBirim == volume[3]{
            sonVeri = mLHesapla / 568
            
        }else if selectedSecondBirim == volume[4]{
            sonVeri = mLHesapla / 3785.411784
            
        }
        
        return sonVeri
        
    }
    

   
    var body: some View {
        NavigationStack{
            Form{
                
                Section{
                  
                    TextField("Birim girin", value : $girilenBirim , format: .number).multilineTextAlignment(.center)
                  
                    Picker("", selection: $selectedBirim){
                        ForEach(volume , id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    Text("\(mLHesapla, specifier: "%.3f") ml")


                }
                
                
                
                Section(" ml convert to"){
                    
                    
                    Picker("", selection: $selectedSecondBirim){
                        ForEach(volume , id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    Text("\(donustur, specifier: "%.3f") \(selectedSecondBirim) ")
                    
                }
                
                
                
            }
            .navigationTitle("FLUID CALC🥛")
        }
    }
}

#Preview {
    ContentView()
}
