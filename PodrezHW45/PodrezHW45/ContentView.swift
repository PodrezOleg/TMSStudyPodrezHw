//
//  ContentView.swift
//  PodrezHW45
//
//  Created by Oleg Podrez on 23.11.24.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    @State  var data: [ChartData] = [
        ChartData(value: 5, label: "Monday"),
        ChartData(value: 10, label: "Tuesday"),
        ChartData(value: 95, label: "Wednesday"),
        ChartData(value: 20, label: "Thursday"),
        ChartData(value: 79, label: "Friday"),
        ChartData(value: 30, label: "Saturday"),
        ChartData(value: 35, label: "Sunday")
    ]
    var body: some View {
        VStack {
            Chart {
                ForEach(data) { entry in
                    BarMark(
                        x: .value("Day", entry.label),
                        y: .value("Value", entry.value)
                    )
                    .foregroundStyle(Color.orange)
                }
            }
            .frame(height: 200)
            .padding()
            
            VStack (alignment: .center) {
                Text("Curent Value")
                    .font(.headline)
                
                ForEach(data.indices, id: \.self) { index in
                    DataRowView(data: $data[index])
                }
            }
        }
        Spacer()
    }
}
            
struct DataRowView: View {
    @Binding var data: ChartData
    
    var body: some View {
       
            HStack  {
                Spacer()
                Button(action: {
                    data.value -= 1
                }) {
                    Text("-")
                   
                        .frame(width: 30, height: 30)
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                VStack {
                    
                    Text("\(data.label): \(String(format: "%.0f", data.value))")
                        .frame(maxWidth: 150)
                        .font(.body)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding(.vertical)
                    
                }
                
                Button(action: {
                    data.value += 1
                }) {
                    Text("+")
                        .frame(width: 30, height: 30)
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }
    }

}
    
struct ChartData: Identifiable {
    let id: UUID = UUID()
    var value: Double
    let label: String
}

#Preview {
    ContentView()
}
