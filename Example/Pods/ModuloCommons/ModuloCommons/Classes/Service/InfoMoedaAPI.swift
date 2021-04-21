//
//  InfoMoedaAPI.swift
//  OnboardingMobileChallenge
//
//  Created by Jaqueline Bittencourt Santos on 14/04/21.
//

import UIKit
import Foundation
import Alamofire


public class InfoMoedaAPI: NSObject {
    
    var moedaInfo: [MoedaInfoElement] = []
    var erros = Erros()
    
    public func requestInfoMoedas(id: String, completionHandler: @escaping([MoedaInfoElement]) -> Void){ // Voltar e ver a necessidade de ser um array, creio que não
            
            let url = "\(DadosChamadaApi.urlListaMoedas)\(id)"
            
            AF.request(url, method: .get, headers: DadosChamadaApi.headers).response { [self]
                (responseData) in
                guard let data = responseData.data else {return}
                print(data)
                do {
                    let retorno = try JSONDecoder().decode([MoedaInfoElement].self, from: data)
                    completionHandler(retorno)
                    
                } catch{
                    guard let statusCode = responseData.response?.statusCode else {return}
                    self.erros.sobrescreverMensagemDeErro(statusCode: statusCode)
                }
        }
    }
}

