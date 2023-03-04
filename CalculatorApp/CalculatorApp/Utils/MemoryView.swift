//
//  MemoryView.swift
//  CalculatorApp
//
//  Created by Murad Ismayilov on 04.03.23.
//

import SwiftUI

struct MemoryView: View {
    
    @Binding var memory: Double
    
    var geometry: GeometryProxy
    
    var body: some View {
        
        let memorySwipe = DragGesture(minimumDistance: 20).onEnded { _ in
            memory = 0.0
        }
        
        HStack {
            
            Spacer()
            
            Text("\(memory)")
                .accessibilityIdentifier("memoryDisplay")
                .padding(.horizontal, 5)
                .frame(width: geometry.size.width * 0.85, alignment: .trailing)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color.gray))
                .gesture(memorySwipe)
            
            Text("M")
            
        }
        .padding(.bottom).padding(.horizontal, 5)
    }
}
