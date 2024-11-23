//
//  ContentViewButtons.swift
//  PodrezHW46
//
//  Created by Oleg Podrez on 23.11.24.
//

import SwiftUI

struct MainViewButtons: View {
    var body : some View {
        NavigationView {
            ZStack {
                Color.orange
                    .ignoresSafeArea()
                
                VStack (spacing: 20) {
                    NavigationLink(destination: CircleView()){
                        ZStack{
    
                            Image("circleView")
                                .frame(width: 300, height: 150)
                                .mask(Circle())
                            Text("Banana")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.black)
                        }
                    }
                 
                    NavigationLink(destination: SquareView()){
                        ZStack{
                            Image("squareView")
                                .fixedSize()
                                .frame(width: 200, height: 100)
                                .mask(Rectangle())
                            Text("Wine")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                        NavigationLink(destination: StarView()){
                            ZStack{
                                Image("starView")
                                    .fixedSize()
                                    .frame(width: 200, height: 100)
                                    .mask(Capsule())
                                Text("Red")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                      
                    }
                    
                }
                
            }
        }
    }
#Preview {
    MainViewButtons()
}

