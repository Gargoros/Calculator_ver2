//
//  EnumerationButtons.swift
//  Calculator_ver2
//
//  Created by MIKHAIL ZHACHKO on 29.11.23.
//

import SwiftUI


// MARK: Buttons
enum CalcButtons: String {
    
    // MARK: number buttons
    case one   = "1"
    case two   = "2"
    case three = "3"
    case four  = "4"
    case five  = "5"
    case six   = "6"
    case seven = "7"
    case eight = "8"
    case nine  = "9"
    case zero  = "0"
    
    // MARK: operators buttons
    case plus      = "+"
    case minus = "-"
    case multiple = "×"
    case divide   = "÷"
    case equal    = "="
    case present  = "%"
    case decimal  = "."
    case clear    = "AC"
    case negative = "IMGplus.forwardslash.minus"
    case undo     = "IMGdelete.backward"
    
    var buttonsColor: Color {
        switch self {
        case .plus, .minus, .multiple, .divide, .equal, .present, .decimal, .clear, .negative, .undo:
            return operatorButtonColor
        default:
            return numberButtonColor
        }
    }
    
    var buttonTextColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
            return numberTextColor
        default:
            return operatorTextColor
        }
    }
    
}


// MARK: Operation
enum Operation {
    case addition, subtract, multiply, divide, none
}
