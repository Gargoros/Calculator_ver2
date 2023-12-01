//
//  Calculator_ver2App.swift
//  Calculator_ver2
//
//  Created by MIKHAIL ZHACHKO on 27.11.23.
//

import SwiftUI

@main
struct CalclApp: App {
    var body: some Scene {
        
        @StateObject var calcViewModel = CalcViewModel()
        WindowGroup {
            MainView()
                .environmentObject(calcViewModel)
        }
    }
}
