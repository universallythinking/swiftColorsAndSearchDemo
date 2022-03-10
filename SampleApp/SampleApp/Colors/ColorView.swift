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
        VStack {
            Text("Search Apple Music")
                .background(Color(.black))
                .frame(width: .infinity, height: 50)
                .padding(.all, 10)
                .font(.system(size: 22))
            ForEach(0..<colors.count) { i in
                Spacer()
                Button(Array(colors)[i].key.uppercased()) {
                    self.selectedColor = Array(colors)[i].value
                    self.selectedColorText = Array(colors)[i].key
                }.foregroundColor(.white)
                .padding(5)
                .background(Array(colors)[i].value)
                .frame(width: .infinity, height: 40)
                .font(.system(size: 25))
            }
            Spacer()
            Text("You chose \(self.selectedColorText)...").foregroundColor(self.selectedColor)
            Spacer()
        }
    }
}

// I deleted the content previews for sake of speed while debugging
