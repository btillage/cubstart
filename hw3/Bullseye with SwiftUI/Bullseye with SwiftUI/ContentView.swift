//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var mode = false
    @State private var x: Double = 50
    @State private var check = false
    
    
    var body: some View {
            VStack() {
                HStack() {
                    VStack() {
                        Text("High Score")
                        Text("0")
                    }
                    
                    .padding([.top, .leading], 20)
                    Spacer()
                    
                    VStack() {
                        Text("Current Level")
                        Text("1")
                    }
                    .padding([.top, .trailing], 20)

                }
                
                Spacer()
                
                //Text
                VStack() {
                    Text("Move the slider to:")
                        .padding(.bottom, 10.0)
                        .font(.system(size: 30))
                    Text(String(25))
                        .font(.system(size: 30))
                }
                
                //Slider and Check
                VStack() {
                    Slider(value: $x, in: 0...100)
                        .padding(.bottom, 20)
                    Button("Check") {
                        check.toggle()
                    }
                }
                                    
                
                Spacer()
                
                //Switch
                VStack() {
                    Text("Exact Mode?")
                    Toggle("", isOn: $mode)
                        .padding(.trailing, 175)
                    
                }
            }
        }
}


