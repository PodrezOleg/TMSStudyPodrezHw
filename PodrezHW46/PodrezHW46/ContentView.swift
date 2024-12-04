//
//  ContentView.swift
//  PodrezHW46
//
//  Created by Oleg Podrez on 22.11.24.
//

import SwiftUI

struct ContentView: View {
<<<<<<< Updated upstream

=======
    let tabs: [TabElements] = [
        
        TabElements(title: "Круг", icon: "circle.fill"),
        TabElements(title: "Квадрат", icon: "square.fill"),
        TabElements(title: "Звезда", icon: "star.fill")
    ]
    
>>>>>>> Stashed changes
    init() {
        UITabBar.appearance().backgroundColor = UIColor.quaternarySystemFill
    }
    
    var body: some View {
        TabView {
<<<<<<< Updated upstream
            Tab("Circle", systemImage: "circle.fill") {
                CircleView()
            }
            Tab("Sqyare", systemImage: "square.fill") {
                SquareView()
            }
            Tab("Star", systemImage: "Star.fill") {
                StarView()
            }
        }
    }
        
        #Preview {
            ContentView()
        }
    }
=======
            ForEach(Array(tabs.enumerated()), id: \.element.icon) { index, tab in
                getTabView(for: index)
                    .tabItem {
                        Label(tab.title, systemImage: tab.icon)
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
    }


        #Preview {
            ContentView()
        }
    
>>>>>>> Stashed changes
