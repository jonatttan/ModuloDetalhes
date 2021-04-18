//
//  ExtensionValues.swift
//  ModuloCommons
//
//  Created by Jonattan Moises Sousa on 18/04/21.
//

import Foundation

// Formatador de valores
public extension Double {
    
    var formatDolar: String { return formatadorDolar(valor: self) }
    
    func formatadorDolar(valor: Double) -> String {
        let valorNS = NSNumber(value: valor)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        guard let valorFormatado = formatter.string(from: valorNS) else { return ""}
        return valorFormatado
    }
}
