//
//  TabsView.swift
//  SampleApp
//
//  Created by Brooks Barnett on 3/10/22.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
            TabView {
                ColorView()
                    .tabItem {
                        Label("Colors", systemImage: "square.and.pencil")
                    }
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass.circle.fill")
                    }
                PhoneView()
                    .tabItem {
                        Label("Phone Book", systemImage: "book")
                    }
            }
        }
}
