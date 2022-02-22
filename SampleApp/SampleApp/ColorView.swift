//
//  ColorView.swift
//  SampleApp
//
//  Created by Brooks Barnett on 2/22/22.
//

import SwiftUI

struct ColorView: View {
    
    @State var selection = 0
    @State var selectedColor = Color.black
    @State var selectedColorText = ""
    var colors = ["red": Color.red, "green": Color.green, "blue": Color.blue]
    
    

    var body: some View {
        
        if (selection == 0) {
            Text("Pick a color")
            VStack {
                ForEach(0..<colors.count) { i in
                    Spacer()
                    Button(Array(colors)[i].key.uppercased()) {
                        self.selectedColor = Array(colors)[i].value
                        self.selectedColorText = Array(colors)[i].key
                    }
                }
                Spacer()
                Text("You chose \(self.selectedColorText)...").foregroundColor(self.selectedColor)
                Spacer()
                Button(action: {
                    selection = 1
                }, label: {
                    Text("Search Apple Music")
                        .foregroundColor(.black)
                        .padding(10)
                        .background(Color.green)
                        .cornerRadius(10)
                })
            }
        } else {
            SearchView()
        }
    }
}

// I deleted the content previews for sake of speed while debugging
