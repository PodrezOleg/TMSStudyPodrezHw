//
//  ContentView.swift
//  PodrezHW46
//
//  Created by Oleg Podrez on 22.11.24.
//

import SwiftUI

struct ContentView: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor.quaternarySystemFill
    }
    
    var body: some View {
        TabView {
            Tab("Circle", systemImage: "circle.fill") {
                CircleView()
            }
            Tab("Sqyare", systemImage: "square.fill") {
                SquareView()
            }
            Tab("Star", systemImage: "star.fill") {
                StarView()
            }
        }
    }
        
        #Preview {
            ContentView()
        }
    }

