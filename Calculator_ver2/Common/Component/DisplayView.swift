//
//  DisplayView.swift
//  Calculator_ver2
//
//  Created by MIKHAIL ZHACHKO on 29.11.23.
//

import SwiftUI

struct DisplayView: View {
    
    @Binding var mainResult: String
    
    let displayWidth: CGFloat
    let displayHeight: CGFloat

    var body: some View {
        ZStack{
            Color.displayBackgroundColor
                .ignoresSafeArea()
            
            HStack{
                Spacer()
                VStack(alignment: .trailing) {
                    Spacer()
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
        .shadow(color: .shadowColor, radius: 6, x: 8, y: 8)
        .shadow(color: .white, radius: 8, x: -8, y: -8)
        
        
    }
}

#Preview {
    DisplayView(
        mainResult: .constant("45"),
        displayWidth: .infinity,
        displayHeight: 200
    )
}
