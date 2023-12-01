//
//  Extention.swift
//  Calculator_ver2
//
//  Created by MIKHAIL ZHACHKO on 29.11.23.
//

import Foundation

// MARK: Extension: Button to Operation
extension CalcButtons {
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
