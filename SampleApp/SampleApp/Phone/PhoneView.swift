//
//  PhoneView.swift
//  SampleApp
//
//  Created by Brooks Barnett on 2/23/22.
//

import SwiftUI
import Contacts

struct PhoneView: View {
    
    var body: some View {
        VStack {
            Text("Select People")
                .background(Color(.black))
                .frame(width: .infinity, height: 50)
                .padding(.all, 10)
                .font(.system(size: 22))
            PhoneButtons()
            Divider()
        }

    }
    
}



// I deleted the content previews for sake of speed while debugging

