//
//  CircleView.swift
//  PodrezHW46
//
//  Created by Oleg Podrez on 22.11.24.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            Image("Oleg")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFit()
                .cornerRadius(30)
            
            Text("Макет где?")
                .padding()
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}
    #Preview {
        CircleView()
    }
