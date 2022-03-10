//
//  PhoneButtons.swift
//  SampleApp
//
//  Created by Brooks Barnett on 3/10/22.
//

import SwiftUI

struct PhoneButtons: View {
    @State var numbers: [[String]] = [["START", "BEGIN"]]
    @State var phoneList: [String] = []
    
    var body: some View {
        ScrollView {
            ForEach (numbers.indices, id: \.self) { n in
                HStack {
                    Button(numbers[n][0].description) {
                        PhoneLogic().editArray(numbers[n][1].description)
                        phoneList.append(numbers[n][1].description)
                    }
                    .foregroundColor(
                        phoneList.filter{$0 == numbers[n][1].description}.count % 2 == 1 ? Color(.green) : (n % 2 == 0) ? Color(.white) : Color(.white)
                    )
                    .background(Color(.black))
                    .frame(width: .infinity, height: 25)
                    .padding(.all, 2)
                    .font(.system(size: 20))
                    Spacer()
                }
                Divider().id(n)
                
            }
        }
        .onAppear {
            numbers = PhoneLogic().getContacts()
        }
        Button(action: {
            phoneList = []
        }) {
            HStack {
                Image(systemName: "book")
                Text("Reset Selections")
            }.padding(10.0)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 2.0)
            )
        }
    }
}
