//
//  UISliderViewRepresentation.swift
//  SliderGame
//
//  Created by Nikolai Grachev on 23.12.2023.
//

import SwiftUI

struct UISliderViewRepresentation: UIViewRepresentable {
    
    @Binding var currentValue: Float
    
    func makeUIView(context: Context) -> UISlider {

        let sliderView = UISlider(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
        
        sliderView.minimumValue = 0
        sliderView.maximumValue = 100
        sliderView.value = currentValue
        
        return sliderView
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        currentValue = uiView.value
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}


extension UISliderViewRepresentation {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        func resetButtonTaped() {
            value = 0
        }
    }
}

//#Preview {
//    UISliderViewRepresentation as! any View
//}
