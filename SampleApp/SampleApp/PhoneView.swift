//
//  PhoneView.swift
//  SampleApp
//
//  Created by Brooks Barnett on 2/23/22.
//

import SwiftUI
import Contacts

struct PhoneView: View {
    
    @State var numbers: [[String]] = [["START", "BEGIN"]]
    @State var active: Bool = false
    @State var selection = 0

    var body: some View {

        if (selection == 0) {
            Text("\(numbers.count)")
            ScrollView {
                ForEach (numbers.indices, id: \.self) { n in
                    Text(numbers[n][0].description)
                    Text(numbers[n][1].description)
                    Spacer().id(n)
                }
            }
            Button("Search") {
                numbers = PhoneContacts().getContacts()
            }.frame(alignment: .center)
            Spacer()
            .onAppear {
                numbers = PhoneContacts().getContacts()
            }
            Button(action: {
                selection = 1
            }, label: {
                Text("Show Color View")
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.green)
                    .cornerRadius(10)
            })
        } else {
            ColorView()
        }
        

    }
    
    
    
    
}

// I deleted the content previews for sake of speed while debugging

