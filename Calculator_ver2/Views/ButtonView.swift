//
//  ButtonView.swift
//  Calculator_ver2
//
//  Created by MIKHAIL ZHACHKO on 30.11.23.
//

import SwiftUI

struct ButtonView: View {
    
    let buttonSize: CGFloat
    let button: CalcButtons

    
    var systemImage: String? {
            let value: String = button.rawValue
            return value.contains("IMG") ? value.replacingOccurrences(
                of: "IMG",
                with: "") : nil
        }
    var text: String? {
            let value: String = button.rawValue
            return value.contains("IMG") ? nil : value
        }
    
    var body: some View {
        
        ZStack{
            if text != nil{
                Text(button.rawValue)
                    .font(Font.custom("Orbitron-Regular", size: 18))
                    .foregroundStyle(Color(button.buttonTextColor))
                    .fontWeight(.bold)
                    .frame(
                        width: buttonSize,
                        height: buttonSize
                    )
                    .padding()
                    .background(
                        Color(button.buttonsColor)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: shadowColor, radius: 4, x: 4, y:4)
                    .shadow(color: .white, radius: 4, x: -4, y: -4)
            }else{
                Image(systemName: systemImage ?? "")
                    .resizable()
                    .frame(
                        width: 24,
                        height: 20
                    )
                    .font(Font.custom("Orbitron-Regular", size: 18))
                    .foregroundStyle(Color(button.buttonTextColor))
                    .fontWeight(.bold)
                    .frame(
                        width: buttonSize,
                        height: buttonSize
                    )
                    .padding()
                    .background(
                        Color(button.buttonsColor)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: shadowColor, radius: 4, x: 4, y:4)
                    .shadow(color: .white, radius: 4, x: -4, y: -4)
            }
            
        }
    }
}

#Preview {
    ButtonView(
        buttonSize: 24,
        button: CalcButtons.plus
    )
}
