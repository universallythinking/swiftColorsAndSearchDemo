//
//  ColorButton.swift
//  SampleApp
//
//  Created by Brooks Barnett on 3/10/22.
//

import SwiftUI

struct ColorButtons: View {
    
    @State var selectedColor = Color.black
    @State var selectedColorText = ""
    
    var colors: [(plainText: String, color: Color)] =
        [("red", Color.red), ("green", Color.green), ("blue", Color.blue)]
    
    var body: some View {
        ForEach(0..<colors.count) { i in
            Button(action: {
                self.selectedColor = Array(colors)[i].color
                self.selectedColorText = Array(colors)[i].plainText
            })
            {
                HStack {
                    Text(Array(colors)[i].plainText.uppercased())
                        .foregroundColor(
                            Array(colors)[i].color
                        )
                }.padding(10.0)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0)
                )
            }
        }
        Text("You chose \(self.selectedColorText)...")
                .foregroundColor(self.selectedColor)
                .font(.system(size: 25))
    }
}
