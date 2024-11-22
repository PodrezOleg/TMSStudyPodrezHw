//
//  StarView.swift
//  PodrezHW46
//
//  Created by Oleg Podrez on 22.11.24.
//

import SwiftUI

struct StarView: View {
    var body: some View {
        VStack {
        Rectangle()
                .fill(Color.pink)
                .frame(width: 350, height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 20))
               
            Text("Title")
                .font(.largeTitle)
                .bold()
            
            Text("«Красный квадрат» — картина Казимира Малевича, написанная в 1915 году. Представляет собой красный четырёхугольник на белом фоне, несколько отличающийся по форме от квадрата. Экспонируется в Русском музее. Впервые представлен публике на выставке «0,10» 1915 года. В каталоге выставки 1915 года картина указана под названием «Живописный реализм крестьянки в двух измерениях». На обороте картины — сокращённое название: «Женщина в двух измерениях».")
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 10)
        }
        
        Spacer()
    }
}
    #Preview {
        StarView()
    }

