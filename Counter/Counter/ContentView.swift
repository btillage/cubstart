//
//  ContentView.swift
//  Counter
//
//  Created by Berry Tillage on 2/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var counter = 0
    
    var body: some View {
        VStack(spacing: 50) {
            Text(String(counter))
                .padding()
                .font(.system(size: 50))
            HStack(spacing: 50) {
                Button("Increment") {
                    counter += 1
                }
                Button("Decrement") {
                    if counter > 0 {
                        counter -= 1
                    }
                }
            }
        }

        
    }
}

