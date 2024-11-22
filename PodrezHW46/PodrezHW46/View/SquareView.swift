//
//  SquareView.swift
//  PodrezHW46
//
//  Created by Oleg Podrez on 22.11.24.
//

import SwiftUI

struct SquareView: View {
    var body: some View {
        
        ZStack{
            Color.yellow
                .ignoresSafeArea()
            
            Rectangle()
                .fill(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 40)
                .padding(.bottom, 40 )
                .padding(.horizontal, 20)
            
            VStack {
                
                Spacer()
                
                Text("Wine Dishes")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Text("Balcan")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Image("wine")
                    .resizable()
                    .frame(minWidth: 200, minHeight:300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .scaledToFit()
                    .padding(.horizontal, 20)
                
                Text("$25")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                
                Button(action: {
                    print("buy wine")
                }){
                    Text("Buy")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 100, height: 50)
                        .background(Color.yellow)
                        .cornerRadius(25)
                }
                Spacer()
            }
        }
    }
}

    #Preview {
        SquareView()
    }
