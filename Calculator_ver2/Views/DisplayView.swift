//
//  DisplayView.swift
//  Calculator_ver2
//
//  Created by MIKHAIL ZHACHKO on 29.11.23.
//

import SwiftUI

struct DisplayView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let displayWidth: CGFloat
    let displayHeight: CGFloat

    var body: some View {
        ZStack{
            displayBackgroundColor
                .ignoresSafeArea()
            
            HStack{
                Spacer()
                VStack(alignment: .trailing) {
                    Spacer()
                    Text(currentComputation)
                        .font(Font.custom("Orbitron-Regular", size: 30))
                    Text(mainResult)
                        .font(Font.custom("Orbitron-Bold", size: 40))
                }
                .lineLimit(1)
                .multilineTextAlignment(.trailing)
                .minimumScaleFactor(0.1)
                .padding()
            }

            
        }
        .clipShape(RoundedRectangle(cornerRadius: 17))
        .padding()
        .frame(width: displayWidth, height: displayHeight)
        .shadow(color: shadowColor, radius: 6, x: 8, y: 8)
        .shadow(color: .white, radius: 8, x: -8, y: -8)
        
        
    }
}

#Preview {
    DisplayView(
        currentComputation: .constant("35 + 10"),
        mainResult: .constant("45"),
        displayWidth: .infinity,
        displayHeight: 200
    )
}
