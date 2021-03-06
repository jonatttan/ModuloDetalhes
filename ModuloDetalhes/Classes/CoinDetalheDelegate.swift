//
//  Delegate.swift
//  ModuloDetalhes
//
//  Created by Jonattan Moises Sousa on 15/04/21.
//

import Foundation

public protocol CoinDetalheDelegate: class {
    func favoritar(_ id: String, _ acao: Bool)
    func voltar()
}
