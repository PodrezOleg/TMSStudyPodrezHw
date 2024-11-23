//
//  ContentView.swift
//  PodrezHW45
//
//  Created by Oleg Podrez on 23.11.24.
//

import SwiftUI
import Charts

struct ContentView: View {

    @State var number: Int = 0
    @State  var data: [ChartData] = [
        ChartData(value: 5, label: "Mon"),
        ChartData(value: 10, label: "Tue"),
        ChartData(value: 223, label: "Wed"),
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
            
            HStack {
                MinusButton(data: $data)
                NumberView(data: data)
                PlusButton(data: $data)
            }
        }
    }
    
    struct NumberView: View {
        var data: [ChartData]

        var body: some View {
            VStack {
                Text("Current Values")
                    .font(.headline)
                ForEach(data) { entry in
                    Text("\(entry.label): \(String(format: "%.2f", entry.value))")
                }
            }
            .padding()
        }
    }
    
    struct PlusButton: View {
        @Binding var data: [ChartData]
        var body: some View {
            Button(action: {
                for i in data.indices {
                    data[i].value += 1
                }
            }) {
                Text("+")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
    
    
    struct MinusButton: View {
        @Binding var data: [ChartData]
        var body: some View {
            Button(action: {
                for i in data.indices {
                    data[i].value -= 1
                }
            }) {
                Text("-")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
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
