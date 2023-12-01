//
//  ContentView.swift
//  Calculator_ver2
//
//  Created by MIKHAIL ZHACHKO on 27.11.23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var calcViewModel: CalcViewModel
    
    var body: some View {
        
        GeometryReader {geometry in
            ZStack {
                //  MARK: Background
                BackgroundView()
                
                //  MARK: Display
                VStack {
                    DisplayView(
                        currentComputation: $calcViewModel.value,
                        mainResult: $calcViewModel.value,
                        displayWidth: geometry.size.width,
                        displayHeight: geometry.size.height * 0.3
                    )
                    
                    //  MARK: Numbers buttons
                    Grid (alignment: .center, horizontalSpacing: 20, verticalSpacing: 15) {
                        ForEach(calcViewModel.buttonsArray, id: \.self) {rowButtons in
                            GridRow {
                                ForEach(rowButtons, id: \.self) {button in
                                    Button(
                                        action: {
                                            calcViewModel.didTap(button: button)
                                        },
                                        label: {
                                            ButtonView(
                                                buttonSize: geometry.size.width * 0.1,
                                                button: button
                                            )
                                    })
                                }
                            }
                        }
                    }
                }
                
                
            }
        }
    }
    
   
}

#Preview {
    MainView()
        .environmentObject(CalcViewModel())
}
