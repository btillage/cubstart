//
//  CustomCell.swift
//  Shopping List
//
//  Created by Berry Tillage on 4/1/22.
//


import SwiftUI

struct CustomCell: View {
    
    var itemName: String
    
    var quantity: String
    
    var body: some View {
        HStack {
            Text(itemName)
                .padding()
            
            Spacer()
            
            Text(quantity)
        }
    }
}

