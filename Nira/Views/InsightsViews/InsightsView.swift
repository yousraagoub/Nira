//
//  InsightsView.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 11/06/1447 AH.
//
let memoryTrainingData: [sessionData] = [
    .init(day: "SUN", value: 20),
    .init(day: "MON", value: 11),
    .init(day: "TUE", value: 10),
    .init(day: "WED", value: 13)
]

import SwiftUI
import Charts

struct TrainingBarChart: View {
    let data: [sessionData]

    var body: some View {
        Chart(data) { item in
            BarMark(
                x: .value("Day", item.day),
                y: .value("Value", item.value)
            )
            .cornerRadius(6)
            .foregroundStyle(Color("PrimaryDark"))
        }
        .chartXAxis {
            AxisMarks(position: .bottom)
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .padding(20)
        .frame(height: 220)
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(.systemGray6))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
        )
        .padding()
    }
}


struct InsightsView: View {
    @Binding var path: NavigationPath
    var body: some View {
        VStack(spacing: 20) {
            Text("Memory Training")
                .font(.title2)
                .fontWeight(.semibold)
            
            TrainingBarChart(data: memoryTrainingData)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(Color(.systemGray5))
        )
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                ToolbarButtonStyle(systemName: "xmark") {
                    if !path.isEmpty {
                        path.removeLast()
                    }
                }
            }
        }

    }
}
