//
//  ContentView.swift
//  PodrezHW46
//
//  Created by Oleg Podrez on 22.11.24.
//

import SwiftUI

struct ContentView: View {
    let tabs = ["Звезда", "Круг", "Квадрат"]
    let icon = ["star.fill", "circle.fill", "square.fill"]

    init() {
        UITabBar.appearance().backgroundColor = UIColor.quaternarySystemFill
       }
    var body: some View {
        
        TabView {
            StarView()
                    .tabItem {
                        Image(systemName: icon[0])
                        Text(tabs[0])
                    }
            
            CircleView()
                .tabItem {
                    Image(systemName: icon[1])
                    Text(tabs[1])
                }
            
            SquareView()
                .tabItem {
                    Image(systemName: icon[2])
                    Text(tabs[2])
                }
            }
        }
    }

#Preview {
    ContentView()
}
