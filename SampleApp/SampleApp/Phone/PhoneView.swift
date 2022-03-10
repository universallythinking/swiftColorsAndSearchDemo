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
    @State var phoneList: [String] = []

    var body: some View {
        VStack {
            Text("Select People")
                .background(Color(.black))
                .frame(width: .infinity, height: 50)
                .padding(.all, 10)
                .font(.system(size: 22))
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
            Divider()
            Button(action: {
                phoneList = PhoneLogic().arr
            }, label: {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.blue)
                    .frame(width: .infinity, height: 40)
                    .font(.system(size: 25))
            })
        }

    }
    
}



// I deleted the content previews for sake of speed while debugging

