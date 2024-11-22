//
//  ContentView.swift
//  PodrezHW46
//
//  Created by Oleg Podrez on 22.11.24.
//

import SwiftUI

struct ContentView: View {
    let tabs = ["Главная", "Профиль", "Настройки"]
    let icon = ["star.fill", "circle.fill", "square.fill"]

    var body: some View {
        TabView {
            ForEach(Array(tabs.enumerated()), id: \.element) {index, tab in
                Text("\(tab) экран")
                    .tabItem {
                        Image(systemName: icon[index])
                        Text(tab)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
