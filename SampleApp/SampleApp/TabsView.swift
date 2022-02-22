//
//  TabView.swift
//  SampleApp
//
//  Created by Brooks Barnett on 2/22/22.
//

import SwiftUI

struct TabsView: View {
    
    @State var selection = 0

    var body: some View {
        
        if (selection == 0) {
            SearchView()
        } else {
            ColorView()
        }
    }
    
    func setSelection (_ sel: Int) {
        self.selection = sel
    }
}

// I deleted the content previews for sake of speed while debugging

