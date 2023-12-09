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
    
    let buttonsArray: Array<Array<CalcButton>> = [
        [.clear, .negative, .present, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .undo, .equal],
    ]
    
    // MARK: Tap Button Method
        func didTap(button: CalcButton) {
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
                clearAll()
                
            case .decimal:
                if !value.contains(".") {
                    value += "."
                }
                
            case .undo:
                //TODO: create delete last symbol function
                break
                
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
            if number != 0 && currentValue != 0{
                return number / currentValue
            }
            return 0
        default:
            return currentValue
        }
    }
    //MARK: Clear all values
    func clearAll(){
        value = "0"
        number = 0.0
        currentOperation = .none
    }
    
    // MARK: Remove Last "0" Method
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
}
