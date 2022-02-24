//
//  TabView.swift
//  SampleApp
//
//  Created by Brooks Barnett on 2/22/22.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

// I deleted the content previews for sake of speed while debugging

