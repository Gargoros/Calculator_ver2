//
//  Extension.swift
//  Calculator_ver2
//
//  Created by MIKHAIL ZHACHKO on 29.11.23.
//

import SwiftUI

//MARK: Extension: Button to Operation
extension CalcButton {
    func toOperation() -> Operation {
        switch self {
        case .plus:
            return .addition
        case .minus:
            return .subtract
        case .multiple:
            return .multiply
        case .divide:
            return .divide
        default:
            return .none
        }
    }
}

//MARK: Colors Extension
extension Color {
    static let backgroundColor:Color         = Color("backgroundColor")
    static let currentTextColor:Color        = Color("currentTextColor")
    static let displayBackgroundColor: Color = Color("displayBackgroundColor")
    static let mainTextColor: Color          = Color("mainTextColor")
    static let numberButtonColor: Color      = Color("numberButtonColor")
    static let numberTextColor: Color        = Color("numberTextColor")
    static let operatorButtonColor: Color    = Color("operatorButtonColor")
    static let operatorTextColor: Color      = Color("operatorTextColor")
    static let shadowColor: Color            = Color("shadowColor")
}

