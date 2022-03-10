//
//  ColorView.swift
//  SampleApp
//
//  Created by Brooks Barnett on 2/22/22.
//

import SwiftUI

struct ColorView: View {
    
    var body: some View {
        VStack {
            Text("Pick a Color")
                .background(Color(.black))
                .frame(width: .infinity, height: 50)
                .padding(.all, 10)
                .font(.system(size: 22))

            ColorButtons()
            
        }
    }

}


// I deleted the content previews for sake of speed while debugging
