//
//  ContentView.swift
//  TimeConverter
//
//  Created by Lance Kent Briones on 4/9/20.
//  Copyright © 2020 Lance Kent Briones. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var read: String = ""
    @State private var holder_from: Int = 0
    @State private var holder_to: Int = 0
    let times = ["Minutes", "Hours", "Seconds"]
    
    var computed: Double {
        let temperature: Double = Double(read) ?? 0
        let hold_from: String = times[holder_from]
        let hold_to: String = times[holder_to]
        
        // Case control flow based on from
        switch hold_from {
            case "Minutes":
                if hold_to == "Seconds"{
                    return temperature * 60
                }
                else if hold_to == "Hours"{
                    return temperature / 60
                }
                else {
                    return temperature
                }
            case "Hours":
                if hold_to == "Minutes"{
                    return temperature * 60
                }
                else if hold_to == "Seconds"{
                    return temperature * pow(Double(60), Double(2))
                }
                else {
                    return temperature
                }
            default:
                if hold_to == "Minutes" {
                    return temperature / 60
                }
                else if hold_to == "Hours" {
                    return temperature / pow(Double(60), Double(2))
                    
                }
                else {
                    return temperature
                }
        }

    }
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Convert time from: ")){
                    TextField("Enter Time", text: $read)
                        .keyboardType(.decimalPad)
                    Picker("from", selection: $holder_from){
                        ForEach(0..<times.count){
                            Text("\(self.times[$0])")
                        }
                    }.pickerStyle(WheelPickerStyle())

                }
                Section(header: Text("Convert time to: ")){
                    Picker("to", selection: $holder_to){
                        ForEach(0..<times.count){
                            Text("\(self.times[$0])")
                        }
                    }.pickerStyle(WheelPickerStyle())
                    
                }
                Section(header: Text("Converted time: ")){
                    Text("\(self.computed, specifier: "%.3f")")
                }
                
            }.navigationBarTitle(Text("Time Converter"), displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
