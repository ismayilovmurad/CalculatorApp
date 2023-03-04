//
//  DisplayView.swift
//  CalculatorApp
//
//  Created by Murad Ismayilov on 04.03.23.
//

import SwiftUI

extension Color {
    static var random: Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)
        )
    }
}

struct DisplayView: View {
    
    @Binding var display: String
    
    var body: some View {
        // MARK: You can use the new Self._printChanges() method to determine what caused the view to redraw. This odd-looking code tells SwiftUI to identify the change that led to SwiftUI deciding to redraw the view. SwiftUI will display the name of the view and the properties that changed each time it draws the view. Notice that the method begins with an underscore hinting that you should only use this when debugging and remove it from a finished app. You must place it inside the body property of the view you want to monitor.
        let _ = Self._printChanges()
        
        HStack {
            if display.isEmpty {
                CustomText(text: "0")
            } else {
                CustomText(text: display)
            }
        }
        .background(Color.random)
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(display: .constant("123"))
    }
}

struct CustomText: View {
    var text = ""
    
    var body: some View {
        Text(text)
            // MARK: Despite the name, VoiceOver doesn’t read the accessibilityIdentifer attribute; this simply provides a way to give a UI element a constant label for testing. Add an accessibilityIdentifer to elements that do not have static text for their label to improve location for testing.
            .accessibilityIdentifier("display")
            .padding(.horizontal, 5)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 2)
                .foregroundColor(Color.gray))
    }
}
