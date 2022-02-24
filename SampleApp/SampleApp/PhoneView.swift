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
    @State var counter = 0
    @State var phoneList: [String] = []
    var colors = [Color.green, .red, .pink, .orange, .blue, .black]
    var arr: [String] = []

    var body: some View {
        if (selection == 0) {
            Text("Select People")
                .background(Color(.black))
                .frame(width: .infinity, height: 50)
                .padding(.all, 2)
                .font(.system(size: 22))
            ScrollView {
                ForEach (numbers.indices, id: \.self) { n in
                    HStack {
                        Button(numbers[n][0].description) {
                            PhoneContacts().editArray(numbers[n][1].description)
                            phoneList.append(numbers[n][1].description)
                        }
                        .foregroundColor(
                            phoneList.filter{$0 == numbers[n][1].description}.count % 2 == 1 ? Color(.green) : (n % 2 == 0) ? Color(.white) : Color(.white)
                        )
                        .background(Color(.black))
                        .frame(width: .infinity, height: 50)
                        .padding(.all, 2)
                        .font(.system(size: 50))
                        Spacer()
                    }
                    Divider().id(n)
                    
                }
            }
            .onAppear {
                numbers = PhoneContacts().getContacts()
            }
            Divider()
            Button(action: {
                phoneList = PhoneContacts().arr
            }, label: {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.black)
                    .frame(width: .infinity, height: 50)
                    .font(.system(size: 50))
            })
            
        } else {
            ColorView()
        }
        

    }
    
}



// I deleted the content previews for sake of speed while debugging

