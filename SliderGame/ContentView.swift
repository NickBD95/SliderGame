//
//  ContentView.swift
//  SliderGame
//
//  Created by Nikolai Grachev on 23.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var targetValue = Int.random(in: 0...100)
    @State var currentValue: Float = 0
    
    
    let lefSideSliderValue = 0
    let rightSideSLiderValue = 100
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("\(lefSideSliderValue)")
                UISliderViewRepresentation(currentValue: $currentValue)
                    
               

                Text("\(rightSideSLiderValue)")
            }
                
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Проверь меня!")
            })
            Button(action: resetTask, label: {
                Text("Начать заново")
            })
            .onChange(of: currentValue) {
                resetTask()
            }
        }
        .padding()
    }
}


extension ContentView {
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
    
    private func resetTask() {
        targetValue = Int.random(in: 0...100)
    }
}

#Preview {
    ContentView()
}
