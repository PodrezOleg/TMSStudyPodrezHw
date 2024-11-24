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
        ChartData(value: 5, label: "Mon"),
        ChartData(value: 10, label: "Tue"),
        ChartData(value: 95, label: "Wed"),
        ChartData(value: 20, label: "Thu"),
        ChartData(value: 79, label: "Fri"),
        ChartData(value: 30, label: "Sat"),
        ChartData(value: 35, label: "Sun")
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
        HStack (alignment: .center) {
            
            Button(action: {
                data.value -= 1
            }) {
                Text("-")
                    .frame(width: 10, height: 20)
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
                    
            }
            Text("\(data.label): \(String(format: "%.0f", data.value))")
                .font(.body)
                .padding(.horizontal)
            
            Button(action: {
                data.value += 1
            }) {
                Text("+")
                    .frame(width: 10, height: 20)
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
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
