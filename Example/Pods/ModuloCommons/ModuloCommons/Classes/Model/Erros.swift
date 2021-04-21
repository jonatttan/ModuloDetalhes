//
//  Erros.swift
//  FBSnapshotTestCase
//  Created by Jaqueline Bittencourt Santos on 14/04/21.
//  Integrado ao Commons 17/04

import Foundation

enum ErrosEnum : String {
    
    case badRequest = "Há algo errado com o seu pedido"
    case unauthorized = "Sua chave de API está errada"
    case forBidden = "Sua chave API não tem privilégios suficientes para acessar este recurso"
    case tooManyRequests = "Você excedeu seus limites de Requisições"
    case noData = "Especificamente este ítem não foi encontrado"
    case serverOff = "Servidor OffLine"
    case unexpectedError = "Erro Inesperado"
}

public class Erros: NSObject {
    
    let erros = [            400: ErrosEnum.badRequest,
                             401: ErrosEnum.unauthorized,
                             403: ErrosEnum.forBidden,
                             429: ErrosEnum.tooManyRequests,
                             550: ErrosEnum.noData,
                             503: ErrosEnum.serverOff
                            ]
    
    public func sobrescreverMensagemDeErro(statusCode: Int) {
        print(erros[statusCode] ?? ErrosEnum.unexpectedError)
    }

}
