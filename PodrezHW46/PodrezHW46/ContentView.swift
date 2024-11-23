//
//  ContentView.swift
//  PodrezHW46
//
//  Created by Oleg Podrez on 22.11.24.
//

import SwiftUI

struct TabElements {
    let title: String
    let icon: String
}

struct ContentView: View {
    let tabs: [TabElements] = [

        TabElements(title: "Круг", icon: "circle.fill"),
        TabElements(title: "Квадрат", icon: "square.fill"),
        TabElements(title: "Звезда", icon: "star.fill")
    ]
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.quaternarySystemFill
    }
    
     var body: some View {
         TabView {
            ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
                getTabView(for: index)
                    .tabItem {
                        Image(systemName: tab.icon)
                        Text(tab.title)
                    }
            }
        }
    }
    
    @ViewBuilder private func getTabView(for index: Int) -> some View {
        switch index {
        
        case 0: CircleView()
        case 1: SquareView()
        case 2: StarView()
        default:
            Text("Error")
        }
    }
    
    #Preview {
        ContentView()
    }
}
