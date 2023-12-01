//
//  CalcViewModel.swift
//  Calculator_ver2
//
//  Created by MIKHAIL ZHACHKO on 1.12.23.
//

import Foundation

class CalcViewModel: ObservableObject {
    
    //MARK: Property
    @Published var value: String = "0"
    @Published var number: Double = 0.0
    @Published var currentOperation: Operation = .none
    
    let buttonsArray: Array<Array<CalcButtons>> = [
        [.clear, .negative, .present, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .undo, .equal],
    ]
    
    // MARK: Tap Button Method
        func didTap(button: CalcButtons) {
            switch button {
            case .plus, .minus, .multiple, .divide:
                currentOperation = button.toOperation()
                number = Double(value) ?? 0
                value = "0"
            case .equal:
                if let currentValue = Double(value) {
                    value = formatResult(performOperation(currentValue))
                }
            case .present:
                if let currentValue = Double(value) {
                    value = formatResult(currentValue / 100.0)
                }
            case .clear:
                value = "0"
            case .decimal:
                if !value.contains(".") {
                    value += "."
                }
            case .negative:
                if let negativeValue = Double(value) {
                    value = formatResult(-negativeValue)
                }
            default:
                if value == "0" {
                    value = String(button.rawValue)
                } else {
                    value += String(button.rawValue)
                }
            }
        }
    
    
    // MARK: Helper Calculation Method
    func performOperation(_ currentValue: Double) -> Double{
        switch currentOperation {
        case .addition:
            return number + currentValue
        case .subtract:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }
    
    // MARK: Remove Last "0" Method
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
}
